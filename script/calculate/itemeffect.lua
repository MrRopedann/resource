--------------------------
--- Piratia Online 		--
--- Graf		   		--
--- Moroz		   		--
--- 2021		   		--
--- Discord - Graf#4664 --
--------------------------

--������� ��� �������� ���� �� ��������� ������
function TransferToTemp ( role, Item )
	--����� ID ��������
	local ID_item = GetItemID ( Item )
	--����� ���-�� ��������
	while(HasItem( role, ID_item, 1 )==1) do
		--������� ������� �� �������
		DelBagItem(role,ID_item,1)
		--������ ������� �� ��������� ������
		GiveItemX( role, 0, ID_item, 1, 4 )
	end
end

--������ �����
function ItemUse_buff ( role , Item ) 
	local StateType = GetChaStateLv ( role , STATE_XLZH ) 
	local StateType = GetChaStateLv ( role , STATE_SHPF ) 
	local StateType = GetChaStateLv ( role , STATE_TSHD ) 
	local StateType = GetChaStateLv ( role , STATE_MLCH ) 
	local StateType = GetChaStateLv ( role , STATE_FZLZ ) 

	if StateType == 0 then

		AddState (role, role, STATE_XLZH, 10, 1800)
		AddState (role, role, STATE_SHPF, 10, 1800)
		AddState (role, role, STATE_MLCH, 10, 1800)
		AddState (role, role, STATE_FZLZ, 10, 1800)
		AddState (role, role, STATE_JSFB, 10, 1800)
		AddState (role, role, STATE_TSHD, 10, 1800)
		ALLExAttrSet(role)
		RefreshCha(role)
		
		SystemNotice( role, "��� �������� 10 ������ ������� �������� �� 30 ����� ")
	else

		PopupNotice( role, "����� ��� ��������! ")

	end
end

--������ ���������
function ItemUse_forg ( role , Item ) 

local Item_One = GetChaItem ( role , 2 , 2  ) 
local NumOne = GetItemForgeParam ( Item_One , 1 ) 
local Item_Two = GetChaItem ( role , 2 , 3  ) 
local NumTwo = GetItemForgeParam ( Item_Two , 1 ) 
local ItemType_One = GetItemType ( Item_One ) 
local ItemType_Two = GetItemType ( Item_Two ) 
local star=0 
if ItemType_One ~= 22 and ItemType_Two ~=27 then 
star = 1 
end 
if ItemType_Two ~=27  then 
if ItemType_One ~= ItemType_Two then 
SystemNotice( role ,"�������� ��� ��������!" ) 
UseItemFailed(role) 
return 0 
end 
elseif ItemType_Two==27 and star == 1 then 
SystemNotice( role ,"�������� ��� ��������!" ) 
UseItemFailed(role) 
return 0 
end 

local i = 0 
NumOne = TansferNum ( NumOne ) 
NumTwo = TansferNum ( NumTwo ) 
NumOne = SetNum_Part1 ( NumOne , 3 ) 
i = SetItemForgeParam ( Item_One , 1 , NumOne ) 
NumTwo = SetNum_Part1 ( NumTwo , 3 ) 
i = SetItemForgeParam ( Item_Two , 1 , NumTwo ) 

local ItemOne_Stone = {} 
local ItemOne_StoneLv = {} 
local ItemOne_StoneID = {} 

ItemOne_Stone[0] = GetNum_Part2 ( NumOne ) 
ItemOne_Stone[1] = GetNum_Part4 ( NumOne ) 
ItemOne_Stone[2] = GetNum_Part6 ( NumOne ) 
ItemOne_StoneLv[0] = GetNum_Part3 ( NumOne ) 
ItemOne_StoneLv[1] = GetNum_Part5 ( NumOne ) 
ItemOne_StoneLv[2] = GetNum_Part7 ( NumOne ) 
ItemOne_StoneID[0] = StoneTpye_ID[ItemOne_Stone[0]] 
ItemOne_StoneID[1] = StoneTpye_ID[ItemOne_Stone[1]] 
ItemOne_StoneID[2] = StoneTpye_ID[ItemOne_Stone[2]] 

NumTwo = SetNum_Part2 ( NumTwo , ItemOne_Stone[0] ) 
NumTwo = SetNum_Part3 ( NumTwo , ItemOne_StoneLv[0] ) 
NumTwo = SetNum_Part4 ( NumTwo , ItemOne_Stone[1] ) 
NumTwo = SetNum_Part5 ( NumTwo , ItemOne_StoneLv[1] ) 
NumTwo = SetNum_Part6 ( NumTwo , ItemOne_Stone[2] ) 
NumTwo = SetNum_Part7 ( NumTwo , ItemOne_StoneLv[2] ) 
SetItemForgeParam ( Item_Two , 1 , NumTwo ) 

	NumOne = SetNum_Part2 ( NumOne , 0 ) 
	NumOne = SetNum_Part3 ( NumOne , 0 ) 
	NumOne = SetNum_Part4 ( NumOne , 0 ) 
	NumOne = SetNum_Part5 ( NumOne , 0 ) 
	NumOne = SetNum_Part6 ( NumOne , 0 ) 
	NumOne = SetNum_Part7 ( NumOne , 0 ) 
	SetItemForgeParam ( Item_One , 1 , NumOne ) 

SystemNotice( role ,"������� ���������� ������� ��������!" ) 

end

--����
function ItemUse_BREAD (role, Item )
	local hp = GetChaAttr(role, ATTR_HP) 
	hp_resume = 800    
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then
		hp = mxhp 
	end 
	SetCharaAttr(hp, role, ATTR_HP) 
end 

--������
function ItemUse_APPLE ( role , Item )
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
		hp_resume = 20    
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then 
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )
end 

--����
function ItemUse_CAKE ( role , Item )
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 180   
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )
end 

--���������� �����
function ItemUse_JLG( role , Item )
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 15   
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )
end 

--������� �����
function ItemUse_SZ ( role , Item )
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 20   
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role ) 
end 

--����
function ItemUse_MG ( role , Item )
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 35  
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )
end 

--���� �������
function ItemUse_MTLG ( role , Item )
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 40  
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )
end 

--������� �����
function ItemUse_BG ( role , Item )
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 50 
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role ) 
end 

--�������� �����
function ItemUse_WCG( role , Item )
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 108 
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )
end 

--��� ����������� ������
function ItemUse_JLGZ( role , Item )
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 250 
	
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )
end 

--��� �� ������� �������
function ItemUse_SZC( role , Item )
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 300
	
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )
end 

--������� ���
function ItemUse_MGT( role , Item )
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 350 
	
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role ) 
end 

--��� ������ �������
function ItemUse_MTLGZ( role , Item )
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 400
	
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role ) 
end 

--���������
function ItemUse_BQL( role , Item )
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 450
	
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )
end 

--��� �������� �������
function ItemUse_WCLLZ( role , Item )
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 500 
	
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )
end 

--��������� ��������
function ItemUse_ZHGZ( role , Item )
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 550
	
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role ) 
end 

--�������� �����
function ItemUse_YYCY( role , Item )
	local sp = GetChaAttr(role, ATTR_SP) 
	--LG("Potion Usage", "Current SP= ", sp , "\n" ) 
	sp_resume = 4 
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then
		sp = mxsp 
		--LG("Potion Usage", "Reached Max SP cap", "\n" ) 
	end 
		--LG("Potion Usage", "SP recovered to", sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP) 
end 

--�������� ����������
function ItemUse_MHHB( role , Item )
	local sp = GetChaAttr(role, ATTR_SP) 
	--LG("Potion Usage", "Current SP= ", sp , "\n" ) 
	sp_resume = 8 
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then
		sp = mxsp 
		--LG("Potion Usage", "Reached Max SP cap", "\n" ) 
	end 
		--LG("Potion Usage", "SP recovered to", sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP) 
end 

--����-�����
function ItemUse_QYGS( role , Item )
	local sp = GetChaAttr(role, ATTR_SP) 
	--LG("Potion Usage", "Current SP= ", sp , "\n" ) 
	sp_resume = 18 
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then
		sp = mxsp 
		--LG("Potion Usage", "Reached Max SP cap", "\n" ) 
	end 
		--LG("Potion Usage", "SP recovered to", sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP) 
end 

--����� ������� �����
function ItemUse_BFCY( role , Item )
	local sp = GetChaAttr(role, ATTR_SP) 
	--LG("Potion Usage", "Current SP= ", sp , "\n" ) 
	sp_resume = 22 
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then
		sp = mxsp 
		--LG("Potion Usage", "Reached Max SP cap", "\n" ) 
	end 
		--LG("Potion Usage", "SP recovered to", sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP) 
end 

--��������� �����
function ItemUse_GCYS( role , Item )
	local sp = GetChaAttr(role, ATTR_SP) 
	--LG("Potion Usage", "Current SP= ", sp , "\n" ) 
	sp_resume = 33  
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then
		sp = mxsp 
		--LG("Potion Usage", "Reached Max SP cap", "\n" ) 
	end 
		--LG("Potion Usage", "SP recovered to", sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP) 
end 

--��� "��������"
function ItemUse_XSHC( role , Item )
	local sp = GetChaAttr(role, ATTR_SP) 
	--LG("Potion Usage", "Current SP= ", sp , "\n" ) 
	sp_resume = 38 
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then
		sp = mxsp 
		--LG("Potion Usage", "Reached Max SP cap", "\n" ) 
	end 
		--LG("Potion Usage", "SP recovered to", sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP) 
end 

--����-����
function ItemUse_MZQYG( role , Item )
	local sp = GetChaAttr(role, ATTR_SP) 
	--LG("Potion Usage", "Current SP= ", sp , "\n" ) 
	sp_resume = 41 
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then
		sp = mxsp 
		--LG("Potion Usage", "Reached Max SP cap", "\n" ) 
	end 
		--LG("Potion Usage", "SP recovered to", sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP) 
end 

--������ ������� �����
function ItemUse_BYS( role , Item )
	local sp = GetChaAttr(role, ATTR_SP) 
	--LG("Potion Usage", "Current SP= ", sp , "\n" ) 
	sp_resume = 59 
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then
		sp = mxsp 
		--LG("Potion Usage", "Reached Max SP cap", "\n" ) 
	end 
		--LG("Potion Usage", "SP recovered to", sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP) 
end 

--��������
function ItemUse_TMLGZ( role , Item )
	local sp = GetChaAttr(role, ATTR_SP) 
	--LG("Potion Usage", "Current SP= ", sp , "\n" ) 
	sp_resume = 100 
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then
		sp = mxsp 
		--LG("Potion Usage", "Reached Max SP cap", "\n" ) 
	end 
		--LG("Potion Usage", "SP recovered to", sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP) 
end 

--���������� �����
function ItemUse_SMG( role , Item )
	local sp = GetChaAttr(role, ATTR_SP) 
	--LG("Potion Usage", "Current SP= ", sp , "\n" ) 
	sp_resume = 111 
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then
		sp = mxsp 
		--LG("Potion Usage", "Reached Max SP cap", "\n" ) 
	end 
		--LG("Potion Usage", "SP recovered to", sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP) 
end 


--����������
function ItemUse_TSJ( role , Item )
	local sp = GetChaAttr(role, ATTR_SP) 
	--LG("Potion Usage", "Current SP= ", sp , "\n" ) 
	sp_resume = 141 
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then
		sp = mxsp 
		--LG("Potion Usage", "Reached Max SP cap", "\n" ) 
	end 
		--LG("Potion Usage", "SP recovered to", sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP) 
end 

--��������� �����
function ItemUse_MHYS( role , Item )
	local sp = GetChaAttr(role, ATTR_SP) 
	--LG("Potion Usage", "Current SP= ", sp , "\n" ) 
	sp_resume = 201 
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then
		sp = mxsp 
		--LG("Potion Usage", "Reached Max SP cap", "\n" ) 
	end 
		--LG("Potion Usage", "SP recovered to", sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP) 
end 

function ItemUse_TZCMB ( role , Item )
	tempt_monster( role ,  99 )

end 

--�� ������������(���������� ������������� ��,�������� ��������)
function hp_med_middle( role , Item )
	--LuaPrint("Enter function hp_med_small( role )  --[[medium HP potion formula]]--") 
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 800 
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	 if hp > mxhp then
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )  --[[medium HP potion formula]]--") 
end 
--�� ������������(���������� ������������� ��,�������������� �������� )
function hp_med_large( role , Item )
	--LuaPrint("Enter function hp_med_small( role )  --[[Big HP potion formula]]--") 
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	local mxhp = GetChaAttr(role, ATTR_MXHP) 
	hp_resume = 0.2 * mxhp 
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
	--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )  --[[big HP potion formula]]--") 
end 

--------------------------------------------------------------------------------------------------
--����� ������ �������
--------------------------------------------------------------------------------------------------
-- �������� ����� (ID 3184)
function Sk_Script_Dpsl ( role , Item )
	local sk_add = SK_DPSL
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--������� ������� (ID 3190)
function Sk_Script_Lzj ( role , Item )
										
	local sk_add = SK_LZJ  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����������� ����� (ID 3193)
function Sk_Script_Lxjy ( role , Item )
	local sk_add = SK_LXJY 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--��� (ID 3167)
function Sk_Script_Lh ( role , Item )
	local sk_add = SK_LH 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� (ID 3200)
function Sk_Script_Ssd ( role , Item )
	local sk_add = SK_SSD  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����������� ���� (ID 3199)
function Sk_Script_Ctd ( role , Item )
	local sk_add = SK_CTD 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--������� ��������� (ID 3213)
function Sk_Script_Dzy ( role , Item )
	local sk_add = SK_DZY 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--��� ����� (ID 3293)
function Sk_Script_Hx ( role , Item ) 											
	local sk_add = SK_HX 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--������������� ���� (ID 3198)
function Sk_Script_Rsd ( role , Item ) 											
	local sk_add =SK_RSD 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



--��������� ������� ����� (ID 3160)
function Sk_Script_Jssl ( role , Item ) 											
	local sk_add = SK_JSSL 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--�������� ���� (ID 3161)
function Sk_Script_Gtyz ( role , Item ) 											
	local sk_add = SK_GTYZ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--�������� (ID 3162)
function Sk_Script_Qhtz ( role , Item ) 											
	local sk_add = SK_QHTZ
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--�������� (ID 3163)
function Sk_Script_Lqhb ( role , Item ) 											
	local sk_add = SK_LQHB 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--������������ (ID 3164)
function Sk_Script_Jdzz ( role , Item ) 											
	local sk_add = SK_JDZZ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


--���������� ���� (ID 3165)
function Sk_Script_Hyz ( role , Item ) 											
	local sk_add = SK_HYZ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	--LG( " learn sk " , " Sk_Script_Hyz ()	: " , "sever determine return= " , a ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


--�������� ��� (ID 3175)
function Sk_Script_Shar ( role , Item ) 											
	local sk_add = SK_SHAR 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	--LG( " learn sk " , " Sk_Script_Hyz ()	: " , "sever determine return= " , a ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


--������� ���� (ID 3166)
function Sk_Script_Zj ( role , Item ) 											
	local sk_add = SK_ZJ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--������ �������� ���� (ID 3168)
function Sk_Script_Jjsl ( role , Item ) 											
	local sk_add = SK_JJSL 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--���������� ��������� (ID 3169)
function Sk_Script_Ymsl ( role , Item ) 											
	local sk_add = SK_YMSL 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--������� (ID 3170)
function Sk_Script_Kb ( role , Item ) 											
	local sk_add = SK_KB  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	--LG( " learn sk " , " function Sk_Script_Kb ()	: " , "sever determine return= " , a ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--���������� ������ (ID 3171)
function Sk_Script_Ttcb ( role , Item ) 											
	local sk_add = SK_TTCB  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--�������� ��� (ID 3172)
function Sk_Script_Mnrx ( role , Item ) 											
	local sk_add = SK_MNRX 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����������� ������ (ID 3173)
function Sk_Script_Swzq ( role , Item ) 											
	local sk_add = SK_SWZQ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� ����� ������ (ID 3174)
function Sk_Script_Ssjjc ( role , Item ) 											
	local sk_add = SK_FSZ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--���������� (ID 3175)
function Sk_Script_Hys ( role , Item ) 											
	local sk_add = SK_HYS  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--�������� ������� (ID 3176)
function Sk_Script_Pxkg ( role , Item ) 											
	local sk_add = SK_PXKG 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--���������� (ID 3177)
function Sk_Script_Qx ( role , Item ) 											
	local sk_add = SK_YS  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--���� � ����� (ID 3178)
function Sk_Script_Bc ( role , Item ) 											
	local sk_add = SK_BC  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


--������� ���� (ID 3179)
function Sk_Script_Guz ( role , Item ) 											
	local sk_add = SK_GWZ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	--LG( " learn sk " , " function Sk_Script_Guz ()	: " , "sever determine return= " , a ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--�������� ������ (ID 3180)
function Sk_Script_Db ( role , Item ) 											
	local sk_add = SK_DB  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--���������� (ID 3181)
function Sk_Script_Mb ( role , Item ) 											
	local sk_add = SK_MB  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--�������� ���� (ID 3182)
function Sk_Script_Shtz ( role , Item ) 											
	local sk_add = SK_SHTZ  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--��������������� (ID 3183)
function Sk_Script_Tzhf ( role , Item ) 											
	local sk_add = SK_TZHF  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--������ ����������� ������ (ID 3187)
function Sk_Script_Gjsl ( role , Item ) 											
	local sk_add = SK_GJSL  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


function Sk_Script_Jfb ( role , Item ) 											
	local sk_add = SK_JFB  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--���� ���� (ID 3189)
function Sk_Script_Yy ( role , Item ) 											
	local sk_add = SK_YY 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--������ �������������� ������ (ID 3192)
function Sk_Script_Hqsl ( role , Item ) 											
	local sk_add = SK_HQSL  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����������� ����� (ID 3193)
function Sk_Script_Lxjy ( role , Item ) 											
	local sk_add = SK_LXJY  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--���������� (ID n\a)
function Sk_Script_Dyjj ( role , Item ) 											
	local sk_add = SK_DYJJ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--��������� ������� (ID 3202)
function Sk_Script_Tj ( role , Item ) 											
	local sk_add = SK_TJ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--���������� (ID 3203)
function Sk_Script_Sj ( role , Item ) 											
	local sk_add = SK_SJ  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--������� � ������ (ID 3204)
function Sk_Script_Bt ( role , Item ) 											
	local sk_add = SK_BT  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--���� (ID 3205)
function Sk_Script_Jsjc ( role , Item ) 											
	local sk_add = SK_JSJC  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--��������� (ID 3206)
function Sk_Script_Xzys ( role , Item ) 											
	local sk_add = SK_XZY  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--�������������� (ID 3207)
function Sk_Script_Hfs ( role , Item ) 											
	local sk_add = SK_HFS  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--���������� ���� (ID 3208)
function Sk_Script_Xlcz ( role , Item ) 											
	local sk_add = SK_XLCZ  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 
--�������� ��� ��
function Sk_Script_CRXSF ( role , Item ) 											
	local sk_add = SK_CRXSF 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--�������� ������ (ID 3209)
function Sk_Script_Syzy ( role , Item ) 											
	local sk_add = SK_SYZY  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--������� ��������� (ID 3213)
function Sk_Script_Dzy( role , Item ) 											
	local sk_add = SK_DZY  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--������ �������������� (ID 3214)
function Sk_Script_Dhfs ( role , Item ) 											
	local sk_add = SK_DHFS  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--���������� ����� (ID 3210)
function Sk_Script_Xlzh ( role , Item ) 											
	local sk_add = SK_XLZH  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--���� ���� (ID 3211)
function Sk_Script_Fzlz ( role , Item ) 											
	local sk_add = SK_FZLZ  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--��������� �������� (ID 3212)
function Sk_Script_Sy ( role , Item ) 											
	local sk_add = SK_SY  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����������� (ID 3215)
function Sk_Script_Fh ( role , Item ) 											
	local sk_add = SK_FH  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--������� ������� (ID 3216)
function Sk_Script_Jsfb ( role , Item ) 											
	local sk_add = SK_JSFB  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--���������� ��� (ID 3217)
function Sk_Script_Tshd ( role , Item ) 											
	local sk_add = SK_TSHD  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--������ ���������� (ID 3218)
function Sk_Script_Xzfy ( role , Item ) 											
	local sk_add = SK_XZFY  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--������� ���� (ID 3219)
function Sk_Script_Ayzz ( role , Item ) 											
	local sk_add = SK_AYZZ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--��������� ����� (ID 3220)
function Sk_Script_Zzzh ( role , Item ) 											
	local sk_add = SK_ZZZH  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--��������� (ID 3221)
function Sk_Script_Sdbz ( role , Item ) 											
	local sk_add = SK_SDBZ  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--��������� ������ (ID 3222)
function Sk_Script_Nzs ( role , Item ) 											
	local sk_add = SK_SYNZ  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--���������� ��� (ID 3223)
function Sk_Script_Xlpz ( role , Item ) 											
	local sk_add = SK_XLPZ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--���������� �������� (ID 3224)
function Sk_Script_Hfwq ( role , Item ) 											
	local sk_add = SK_HFWQ  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--------------------------------------------------------------------------------------------------
--����� ������ ������� (����� ������ �������)
--------------------------------------------------------------------------------------------------

--����� ���� (ID 3226)
function Sk_Script_Ks	( role , Item ) 
	local sk_add = SK_KS  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

----����� � � ������
function Sk_Script_FNZ ( role , Item )										
	local sk_add = SK_FNZ        
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a == 0 then 
		UseItemFailed ( role )  
		return 
	end 
end

function Sk_Script_HW ( role , Item )										
	local sk_add = SK_HW      
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a == 0 then 
		UseItemFailed ( role )  
		return 
	end 
end

function Sk_Script_NLD ( role , Item )										
	local sk_add = SK_NLD         
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a == 0 then 
		UseItemFailed ( role )  
		return 
	end 
end

function Sk_Script_NLSFW ( role , Item )										
	local sk_add = SK_NLSFW         
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a == 0 then 
		UseItemFailed ( role )  
		return 
	end 
end

function Sk_Script_MLCJ ( role , Item )										
	local sk_add = SK_MLCJ         
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a == 0 then 
		UseItemFailed ( role )  
		return 
	end 
end

--�������� � ������������ (ID 2679 - 2688)
function Sk_Script_ZhiZao( role , Item ) 
	local star_lv=GetItemID(Item)-2678
	local sk_add = SK_ZHIZAO  
	local form_sklv = GetSkillLv( role , sk_add ) 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		SystemNotice(role ,"\194\224\236 \237\243\230\229\237 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \232\237\226\229\237\242\224\240\229, \247\242\238\225\251 \226\251\243\247\232\242\252 \253\242\238 \243\236\229\237\232\229")
		--SystemNotice(role ,"��� ����� 1 ��������� ���� � ���������, ����� ������� ��� ������")
		--SystemNotice(role ,"You need at least 1 empty slot to learn this skill")
		UseItemFailed ( role )
		return
	end
	if form_sklv ~= star_lv-1  then 
		UseItemFailed ( role )  
		return 
	end 
	local el_sklv = GetSkillLv( role , SK_KS ) 
	if el_sklv <star_lv  then 	
		SystemNotice ( role , "\194\224\236 \237\243\230\237\238 \226\251\243\247\232\242\252 \240\243\225\234\243 \228\229\240\229\226\224 "..star_lv.." \243\240\238\226\237\255, \247\242\238\225\251 \239\240\238\247\232\242\224\242\252 \253\242\243 \234\237\232\227\243" ) 
		--SystemNotice ( role , "��� ����� ������� ����� ������ "..star_lv.." ������, ����� ��������� ��� �����" )  
		--SystemNotice ( role , "Requires you to master "..star_lv.."Lv woodcutting skill to read this book" ) 
		UseItemFailed ( role )
		return
	end 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if star_lv==1 and Item_CanGet < 1 then
		SystemNotice(role ,"\194\224\236 \237\243\230\229\237 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \232\237\226\229\237\242\224\240\229, \247\242\238\225\251 \226\251\243\247\232\242\252 \253\242\238 \243\236\229\237\232\229")
		--SystemNotice(role ,"��� ����� 1 ��������� ���� � ���������, ����� ������� ��� ������")
		--SystemNotice(role ,"You need at least 1 empty slot to learn this skill")
		UseItemFailed ( role )
		return
	end
	a = AddChaSkill ( role , sk_add, star_lv , 1 , 1 ) 
	if a== 0 then 
		SystemNotice ( role , "\205\229 \245\226\224\242\224\229\242 \238\247\234\238\226 \204\232\240\237\251\245 \237\224\226\251\234\238\226. \207\238\239\251\242\224\233\242\229\241\252 \239\240\238\233\242\232 \234\224\234 \236\238\230\237\238 \225\238\235\252\248\229 \232\241\242\238\240\232\247\229\241\234\232\245 \234\226\229\241\242\238\226." )
		--SystemNotice ( role , "�� ������� ����� ������ �������. ����������� ������ ��� ����� ������ ������������ �������." )
		--SystemNotice ( role , "Not enough LifeSkill points. Please try to complete more story quest." ) 
		UseItemFailed ( role )  
		return 
	end 
	if star_lv==1 then
		local m1 = -1
		local m2 = -1
		m1, m2 = MakeItem ( role , 1068  , 1 , 4 )
		local Itemfinal = GetChaItem ( role , 2 , m2 )
		SetItemAttr(Itemfinal, ITEMATTR_VAL_STR ,1)
		SetItemAttr(Itemfinal, ITEMATTR_MAXENERGY ,10000)
		SetItemAttr(Itemfinal, ITEMATTR_ENERGY ,1)
	end
end 

--���������� �� ������� (ID 2699 - 2708)
function Sk_Script_ZhuZao( role , Item ) 
	local star_lv=GetItemID(Item)-2698
	local sk_add = SK_ZHUZAO  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv ~= star_lv-1  then 
		UseItemFailed ( role )  
		return 
	end 
	local el_sklv = GetSkillLv( role , 0 ) 
	if el_sklv <star_lv  then 
		--SystemNotice ( role , "\194\224\236 \237\243\230\237\238 \226\251\243\247\232\242\252 \228\238\225\251\247\243 \240\243\228\251 "..star_lv.." \243\240\238\226\237\255, \247\242\238\225\251 \239\240\238\247\232\242\224\242\252 \253\242\243 \234\237\232\227\243" )
		--SystemNotice ( role , "��� ����� ������� ������ ���� "..star_lv.." ������, ����� ��������� ��� �����" )
		SystemNotice ( role ,  "Requires you to master "..star_lv.."Lv mining skill to read this book" ) 
		UseItemFailed ( role )
		return
	end 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if star_lv==1 and Item_CanGet < 1 then
		SystemNotice(role ,"\194\224\236 \237\243\230\229\237 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \232\237\226\229\237\242\224\240\229, \247\242\238\225\251 \226\251\243\247\232\242\252 \253\242\238 \243\236\229\237\232\229")
		--SystemNotice(role ,"��� ����� 1 ��������� ���� � ���������, ����� ������� ��� ������")
		--SystemNotice(role ,"You need at least 1 empty slot to learn this skill")
		UseItemFailed ( role )
		return
	end
	a = AddChaSkill ( role , sk_add, star_lv , 1 , 1 ) 
	if a== 0 then 
		SystemNotice ( role , "\205\229 \245\226\224\242\224\229\242 \238\247\234\238\226 \204\232\240\237\251\245 \237\224\226\251\234\238\226. \207\238\239\251\242\224\233\242\229\241\252 \239\240\238\233\242\232 \234\224\234 \236\238\230\237\238 \225\238\235\252\248\229 \232\241\242\238\240\232\247\229\241\234\232\245 \234\226\229\241\242\238\226." )
		--SystemNotice ( role , "�� ������� ����� ������ �������. ����������� ������ ��� ����� ������ ������������ �������." )
		--SystemNotice ( role , "Not enough LifeSkill points. Please try to complete more story quest." ) 
		UseItemFailed ( role )  
		return 
	end
	if star_lv==1 then
		local m1 = -1
		local m2 = -1
		m1, m2 = MakeItem ( role , 1069  , 1 , 4 )
		local Itemfinal = GetChaItem ( role , 2 , m2 )
		SetItemAttr(Itemfinal, ITEMATTR_VAL_STR ,1)
		SetItemAttr(Itemfinal, ITEMATTR_MAXENERGY ,10000)
		SetItemAttr(Itemfinal, ITEMATTR_ENERGY ,1)
	end
	end

--�������� � ��������� (ID 2689 - 2698)
function Sk_Script_PengRen( role , Item ) 
	local star_lv=GetItemID(Item)-2688
	local sk_add = SK_PENGREN  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv ~= star_lv-1  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, star_lv , 1 , 1 ) 
	if a== 0 then 
		SystemNotice ( role , "\205\229 \245\226\224\242\224\229\242 \238\247\234\238\226 \204\232\240\237\251\245 \237\224\226\251\234\238\226. \207\238\239\251\242\224\233\242\229\241\252 \239\240\238\233\242\232 \234\224\234 \236\238\230\237\238 \225\238\235\252\248\229 \232\241\242\238\240\232\247\229\241\234\232\245 \234\226\229\241\242\238\226." )
		--SystemNotice ( role , "�� ������� ����� ������ �������. ����������� ������ ��� ����� ������ ������������ �������." )
		--SystemNotice ( role , "Not enough LifeSkill points. Please try to complete more story quest." ) 
		UseItemFailed ( role )  
		return 
	end 
	if star_lv==1 then
		local m1 = -1
		local m2 = -1
		m1, m2 = MakeItem ( role , 1067  , 1 , 4 )
		local Itemfinal = GetChaItem ( role , 2 , m2 )
		SetItemAttr(Itemfinal, ITEMATTR_VAL_STR ,1)
		SetItemAttr(Itemfinal, ITEMATTR_MAXENERGY ,10000)
		SetItemAttr(Itemfinal, ITEMATTR_ENERGY ,1)
	end
	end

--���������� �� ������� (ID 2709 - 2718)
function Sk_Script_FenJie( role , Item ) 
	local star_lv=GetItemID(Item)-2708
	local sk_add = SK_FENJIE  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv ~= star_lv-0  then 
		UseItemFailed ( role )  
		return 
	end 
	local el_sklv = GetSkillLv( role , SK_DL ) 
	if el_sklv <star_lv  then
		SystemNotice ( role , "\194\224\236 \237\243\230\237\238 \226\251\243\247\232\242\252 \242\240\224\235\229\237\232\229 "..star_lv.." \243\240\238\226\237\255, \247\242\238\225\251 \239\240\238\247\232\242\224\242\252 \253\242\243 \234\237\232\227\243" ) 
		--SystemNotice ( role , "��� ����� ������� �������� "..star_lv.." ������, ����� ��������� ��� �����" ) 
		--SystemNotice ( role , "Requires you to master "..star_lv.." Salvage to read current book" ) 
		UseItemFailed ( role )
		return
	end 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if star_lv==1 and Item_CanGet < 1 then
		SystemNotice(role ,"\194\224\236 \237\243\230\229\237 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \232\237\226\229\237\242\224\240\229, \247\242\238\225\251 \226\251\243\247\232\242\252 \253\242\238 \243\236\229\237\232\229")
		--SystemNotice(role ,"��� ����� 1 ��������� ���� � ���������, ����� ������� ��� ������")
		--SystemNotice(role ,"You need at least 1 empty slot to learn this skill")
		UseItemFailed ( role )
		return
	end
	a = AddChaSkill ( role , sk_add, star_lv , 1 , 1 ) 
	if a== 0 then 
		SystemNotice ( role , "\205\229 \245\226\224\242\224\229\242 \238\247\234\238\226 \204\232\240\237\251\245 \237\224\226\251\234\238\226. \207\238\239\251\242\224\233\242\229\241\252 \239\240\238\233\242\232 \234\224\234 \236\238\230\237\238 \225\238\235\252\248\229 \232\241\242\238\240\232\247\229\241\234\232\245 \234\226\229\241\242\238\226." )
		--SystemNotice ( role , "�� ������� ����� ������ �������. ����������� ������ ��� ����� ������ ������������ �������." )
		--SystemNotice ( role , "Not enough LifeSkill points. Please try to complete more story quest." ) 
		UseItemFailed ( role )  
		return 
	end
	if star_lv==1 then
		local m1 = -1
		local m2 = -1
		m1, m2 = MakeItem ( role , 1070  , 1 , 4 )
		local Itemfinal = GetChaItem ( role , 2 , m2 )
		SetItemAttr(Itemfinal, ITEMATTR_VAL_STR ,1)
		SetItemAttr(Itemfinal, ITEMATTR_MAXENERGY ,10000)
		SetItemAttr(Itemfinal, ITEMATTR_ENERGY ,1)
	end
end 


--������ ���� (ID 3225)
function Sk_Script_Wk	( role , Item ) 
	local sk_add = SK_WK  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--------------------------------------------------------------------------------------------------
--����� ������ �������
--------------------------------------------------------------------------------------------------

--������� (ID 3227)
function Sk_Script_Jr	( role , Item ) 
	local sk_add = SK_JR  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--������� (ID 3228)
function Sk_Script_Sl	( role , Item ) 
	local sk_add = SK_SL  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� �� ������� (ID 3229)
function Sk_Script_Bkzj ( role , Item ) 
	local sk_add = SK_BKZJ   
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--������� (ID 3230)
function Sk_Script_Jf ( role , Item ) 
	local sk_add = SK_JF   
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--������ (ID 3231)
function Sk_Script_Lj ( role , Item ) 
	local sk_add = SK_LJ    
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--������������ ���������� (ID 3232)
function Sk_Script_Hzcr ( role , Item ) 
	local sk_add = SK_HZCR     
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--���������� ��� (ID 3233)
function Sk_Script_Bkcj ( role , Item ) 
	local sk_add = SK_BKCJ      
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--�������� ����� (ID 3234)
function Sk_Script_Sf ( role , Item ) 
	local sk_add = SK_SF       
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� (ID 3235)
function Sk_Script_Xw ( role , Item ) 
	local sk_add = SK_XW        
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� (ID 3236)
function Sk_Script_Mw ( role , Item ) 
	local sk_add = SK_MW        
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--�������� ������ (ID 3237)
function Sk_Script_Lm ( role , Item ) 
	local sk_add = SK_LM         
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--�������� (ID 3238)
function Sk_Script_Pj ( role , Item ) 
	local sk_add = SK_PJ         
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--������������� (ID 3239)
function Sk_Script_Fnq ( role , Item ) 
	local sk_add = SK_FNQ         
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--������� ������ (ID 3197)
function Sk_Script_Bdj ( role , Item ) 
	local sk_add = SK_BDJ         
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����������� ������ (ID 3241)
function Sk_Script_Dj ( role , Item ) 
	local sk_add = SK_DJ         
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--������� (ID 3242)
function Sk_Script_Shpf ( role , Item ) 
	local sk_add = SK_SHPF         
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--unknow2999 - unknow3008 (ID 3263 - 3272)
function Sk_Script_Cf ( role , Item )
	local sk_add = SK_CHF         
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end

--��� (ID 3298)
function Sk_Script_Px ( role , Item )
	local sk_add = SK_PAX         
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end

--������� ����� (ID 3300)
function Sk_Script_MLCH ( role , Item )
	local sk_add = SK_MLCH         
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end

--����������� ������������� (ID 3301)
function Sk_Script_BLYZ ( role , Item )
	local sk_add = SK_BLYZ         
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end
--���� �� ���������� ���������������� �������(����������� ���������� � ����������)
function AddSailSkill ( role , i , sk_add , sailexp_req ) 
	LG ( "AddSailSkill" , "__add a new sailsk________________________ "  ) 

	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv ~= i - 1  then 
		SystemNotice ( role , "This book is unable to raise your current skill level" ) 
		UseItemFailed ( role )  
		return 
	end 

	local sail_exp_remain = GetChaAttr ( role , ATTR_CLEFT_SAILEXP ) 
	if sail_exp_remain < sailexp_req  then 
		SystemNotice ( role , "Remaining Navigation experience insufficient. Unable to raise skill level. Please try harder!" ) 
		UseItemFailed ( role )  
		return 
	end 
	LG ( "AddSailSkill" , "Skill ID" ,  sk_add , "  Skill Level  " , i  ) 
	LG ( "AddSailSkill" , " Exisiting Navigation EXP  " , sail_exp_remain , "  Navigation EXP consumed " , sailexp_req ) 
	sail_exp_remain = sail_exp_remain - sailexp_req 
	LG ( "AddSailSkill" , " Remaining Navigation EXP  " , sail_exp_remain ) 

	SetCharaAttr ( sail_exp_remain , role , ATTR_CLEFT_SAILEXP ) 
	SystemNotice ( role , "Consumes Navigation experience" .. sailexp_req ) 

	a = AddChaSkill ( role , sk_add, 1 , 0 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

function Sk_Script_Hpsl1 ( role , Item ) 
	local i = 1 
	local sk_add = SK_HPSL         
	local sailexp_req = sk_hpsl [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 

end


function Sk_Script_Hpsl2 ( role , Item ) 
	local i = 2 
	local sk_add = SK_HPSL         
	local sailexp_req = sk_hpsl [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end


function Sk_Script_Hpsl3 ( role , Item ) 
	local i = 3 
	local sk_add = SK_HPSL         
	local sailexp_req = sk_hpsl [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Hpsl4 ( role , Item ) 
	local i = 4 
	local sk_add = SK_HPSL         
	local sailexp_req = sk_hpsl [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Hpsl5 ( role , Item ) 
	local i = 5 
	local sk_add = SK_HPSL         
	local sailexp_req = sk_hpsl [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end


function Sk_Script_Hpsl6 ( role , Item ) 
	local i = 6 
	local sk_add = SK_HPSL         
	local sailexp_req = sk_hpsl [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Hpsl7 ( role , Item ) 
	local i = 7 
	local sk_add = SK_HPSL         
	local sailexp_req = sk_hpsl [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Hpsl8 ( role , Item ) 
	local i = 8 
	local sk_add = SK_HPSL         
	local sailexp_req = sk_hpsl [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Hpsl9 ( role , Item ) 
	local i = 9 
	local sk_add = SK_HPSL         
	local sailexp_req = sk_hpsl [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Hpsl10 ( role , Item ) 
	local i = 10 
	local sk_add = SK_HPSL         
	local sailexp_req = sk_hpsl [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Jbjg1 ( role , Item ) 
	local i = 1 
	local sk_add = SK_JBJG         
	local sailexp_req = sk_jbjg [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Jbjg2 ( role , Item ) 
	local i = 2 
	local sk_add = SK_JBJG         
	local sailexp_req = sk_jbjg [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Jbjg3 ( role , Item ) 
	local i = 3 
	local sk_add = SK_JBJG         
	local sailexp_req = sk_jbjg [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Jbjg4 ( role , Item ) 
	local i = 4 
	local sk_add = SK_JBJG         
	local sailexp_req = sk_jbjg [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Jbjg5 ( role , Item ) 
	local i = 5 
	local sk_add = SK_JBJG         
	local sailexp_req = sk_jbjg [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Jbjg6 ( role , Item ) 
	local i = 6 
	local sk_add = SK_JBJG         
	local sailexp_req = sk_jbjg [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Jbjg7 ( role , Item ) 
	local i = 7 
	local sk_add = SK_JBJG         
	local sailexp_req = sk_jbjg [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Jbjg8 ( role , Item ) 
	local i = 8 
	local sk_add = SK_JBJG         
	local sailexp_req = sk_jbjg [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Jbjg9 ( role , Item ) 
	local i = 9 
	local sk_add = SK_JBJG         
	local sailexp_req = sk_jbjg [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Jbjg10 ( role , Item ) 
	local i = 10 
	local sk_add = SK_JBJG         
	local sailexp_req = sk_jbjg [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Cfs1 ( role , Item ) 
	local i = 1 
	local sk_add = SK_CFS         
	local sailexp_req = sk_cfs [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Cfs2 ( role , Item ) 
	local i = 2 
	local sk_add = SK_CFS         
	local sailexp_req = sk_cfs [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Cfs3 ( role , Item ) 
	local i = 3 
	local sk_add = SK_CFS         
	local sailexp_req = sk_cfs [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Cfs4 ( role , Item ) 
	local i = 4 
	local sk_add = SK_CFS         
	local sailexp_req = sk_cfs [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Cfs5 ( role , Item ) 
	local i = 5 
	local sk_add = SK_CFS         
	local sailexp_req = sk_cfs [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Cfs6 ( role , Item ) 
	local i = 6 
	local sk_add = SK_CFS         
	local sailexp_req = sk_cfs [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Cfs7 ( role , Item ) 
	local i = 7 
	local sk_add = SK_CFS         
	local sailexp_req = sk_cfs [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Cfs8 ( role , Item ) 
	local i = 8 
	local sk_add = SK_CFS         
	local sailexp_req = sk_cfs [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Cfs9 ( role , Item ) 
	local i = 9 
	local sk_add = SK_CFS         
	local sailexp_req = sk_cfs [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Cfs10 ( role , Item ) 
	local i = 10 
	local sk_add = SK_CFS         
	local sailexp_req = sk_cfs [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Ctqh1 ( role , Item ) 
	local i = 1 
	local sk_add = SK_CTQH         
	local sailexp_req = sk_ctqh [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Ctqh2 ( role , Item ) 
	local i = 2 
	local sk_add = SK_CTQH         
	local sailexp_req = sk_ctqh [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Ctqh3 ( role , Item ) 
	local i = 3 
	local sk_add = SK_CTQH         
	local sailexp_req = sk_ctqh [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Ctqh4 ( role , Item ) 
	local i = 4 
	local sk_add = SK_CTQH         
	local sailexp_req = sk_ctqh [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 

end

function Sk_Script_Ctqh5 ( role , Item ) 
	local i = 5 
	local sk_add = SK_CTQH         
	local sailexp_req = sk_ctqh [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Ctqh6 ( role , Item ) 
	local i = 6 
	local sk_add = SK_CTQH         
	local sailexp_req = sk_ctqh [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Ctqh7 ( role , Item ) 
	local i = 7 
	local sk_add = SK_CTQH         
	local sailexp_req = sk_ctqh [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Ctqh8 ( role , Item ) 
	local i = 8 
	local sk_add = SK_CTQH         
	local sailexp_req = sk_ctqh [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Ctqh9 ( role , Item ) 
	local i = 9 
	local sk_add = SK_CTQH         
	local sailexp_req = sk_ctqh [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Ctqh10 ( role , Item ) 
	local i = 10 
	local sk_add = SK_CTQH         
	local sailexp_req = sk_ctqh [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Bjkr1 ( role , Item ) 
	local i = 1 
	local sk_add = SK_BJKR         
	local sailexp_req = sk_bjkr [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Bjkr2 ( role , Item ) 
	local i = 2 
	local sk_add = SK_BJKR         
	local sailexp_req = sk_bjkr [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Bjkr3 ( role , Item ) 
	local i = 3 
	local sk_add = SK_BJKR         
	local sailexp_req = sk_bjkr [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Bjkr4 ( role , Item ) 
	local i = 4 
	local sk_add = SK_BJKR         
	local sailexp_req = sk_bjkr [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Bjkr5 ( role , Item ) 
	local i = 5 
	local sk_add = SK_BJKR         
	local sailexp_req = sk_bjkr [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Bjkr6 ( role , Item ) 
	local i = 6 
	local sk_add = SK_BJKR         
	local sailexp_req = sk_bjkr [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Bjkr7 ( role , Item ) 
	local i = 7 
	local sk_add = SK_BJKR         
	local sailexp_req = sk_bjkr [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Bjkr8 ( role , Item ) 
	local i = 8 
	local sk_add = SK_BJKR         
	local sailexp_req = sk_bjkr [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Bjkr9 ( role , Item ) 
	local i = 9 
	local sk_add = SK_BJKR         
	local sailexp_req = sk_bjkr [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Bjkr10 ( role , Item ) 
	local i = 10 
	local sk_add = SK_BJKR         
	local sailexp_req = sk_bjkr [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

--------------------------------------------------------------------------------------------------
--����� ������ ������� (����� ������ �������)
--------------------------------------------------------------------------------------------------

--����������� (ID 3294)
function Sk_Script_By ( role , Item )
	local sk_add = SK_BY         
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 10 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end

--�������� (ID 3295)
function Sk_Script_Dl ( role , Item )
	local sk_add = SK_DL         
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end

--��������� ����� (ID 3296)
function Sk_Script_Btjn ( role , Item )
	local sk_add = SK_BAT         
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end

--������ (ID 3299)
function Sk_Script_Pkqx ( role , Item )
	local sk_add = SK_PKQX         
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end

--------------------------------------------------------------------------------------------------
--������
--------------------------------------------------------------------------------------------------

--�������� ����� (ID 3141)
function Jz_Script_hc(role, Item )
	local i = CheckBagItem(role,3141)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3141,1)
			if j == 1 then
				MoveCity(role,"")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
	
end

--����� �� ����������� (ID 4602)
function Jz_Script_bycs(role, Item )
	local i = CheckBagItem(role,4602)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,4602,1)
			if j == 1 then
				MoveCity(role,"Argent City")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--����� �� ������� (ID 4603)
function Jz_Script_slcs(role, Item )
	local i = CheckBagItem(role,4603)
	local k = ChaIsBoat(role)
	local map_name = GetChaMapName ( role )
	if map_name == "Pkteam" then
	SystemNotice ( role , "\194\251 \237\224\245\238\228\232\242\229\241\252 \226 \242\254\240\252\236\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \225\232\235\229\242" )
                 --SystemNotice ( role , "�� ���������� � ������. ���������� ������������ �����" )
		UseItemFailed ( role )
		return
		end
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,4603,1)
			if j == 1 then
				MoveCity(role,"Shaitan City")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
end


--����� �� ������ (ID 4604)
function Jz_Script_blbcs(role, Item )
	local i = CheckBagItem(role,4604)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,4604,1)
			if j == 1 then
				MoveCity(role,"Icicle Castle")
				return
			end
		end
	else
		UseItemFailed ( role )
	end

end

--����� �� �. ����� (Id 0332)
function Jz_Script_cfzs(role, Item )
	local i = CheckBagItem(role,332)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,332,1)
			if j == 1 then
				MoveCity(role,"Spring Town")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--����� �� �. ����� (ID n\a)
function Jz_Script_cfzsAI(role, Item )
	local i = CheckBagItem(role,5780)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,5780,1)
			if j == 1 then
				MoveCity(role,"Arena Isle")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--------------------------------------------------------------------------------------------------
--����������� ��� � ����
--------------------------------------------------------------------------------------------------

--����������� ��� (ID 4547)
function ItemUse_Wood ( role , Item ) 
	local k = ChaIsBoat ( role ) 
	if k == 0 then 
		UseItemFailed ( role )
		SystemNotice ( role , "\207\240\229\228\236\229\242 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237 \242\238\235\252\234\238 \226 \236\238\240\229" )
		--SystemNotice ( role , "������� ����� ���� ����������� ������ � ����" )
		--SystemNotice ( role , "Item can only be used while sailing" )
		return 
	end 
	local hp = GetChaAttr ( role , ATTR_HP ) 
	local mxhp = GetChaAttr ( role, ATTR_MXHP ) 
	if hp < 0 then 
		UseItemFailed ( role ) 
		SystemNotice ( role , "\209\243\228\237\238 \231\224\242\238\237\243\235\238. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \239\240\229\228\236\229\242" ) 
		--SystemNotice ( role , "����� ��������. ���������� ������������ �������" ) 
		--SystemNotice ( role , "Ship has sunken. Unable to use item" )
	end 
	local statelv = 1
	local statetime = 63
	AddState ( role , role , STATE_MCK , statelv , statetime )
	
 

end 

function State_MCK_Add ( role , statelv ) 
	local hpdmg = -100   
	Hp_Endure_Dmg ( role , hpdmg ) 
	ALLExAttrSet(role)  
end 

function State_MCK_Rem ( role , statelv ) 
end

--���� (ID 4551)
function ItemUse_Fish ( role , Item ) 
	local k = ChaIsBoat ( role ) 
	if k == 0 then 
		UseItemFailed ( role ) 
		SystemNotice ( role , "\207\240\229\228\236\229\242 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237 \242\238\235\252\234\238 \226 \236\238\240\229" )
		--SystemNotice ( role , "������� ����� ���� ����������� ������ � ����" )
		--SystemNotice ( role , "Item can only be used while sailing" 
		return 
	end 
	local sp = GetChaAttr ( role , ATTR_SP ) 
	local mxsp = GetChaAttr ( role, ATTR_MXSP ) 
	local hp = GetChaAttr ( role , ATTR_HP ) 
	local mxhp = GetChaAttr ( role, ATTR_MXHP ) 
	if hp < 0 then 
		UseItemFailed ( role ) 
		SystemNotice ( role , "\209\243\228\237\238 \231\224\242\238\237\243\235\238. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \239\240\229\228\236\229\242" ) 
		--SystemNotice ( role , "����� ��������. ���������� ������������ �������" ) 
		--SystemNotice ( role , "Ship has sunken. Unable to use item" )
	end 
	local sp_resume = 50 
	sp = math.min ( mxsp , sp + sp_resume  ) 
	SetCharaAttr ( sp , role , ATTR_SP ) 
end 

--------------------------------------------------------------------------------------------------
--������ �����
--------------------------------------------------------------------------------------------------

--������ ����� (ID 3915)
function ItemUse_YB ( role , Item )
	local exp = Exp ( role )
	local charLv=Lv ( role )
	local exp_new = 0
	if charLv >= 80 then
		exp_new = exp + 6
	else
		exp_new = exp + 300		
	end
	SetCharaAttr ( exp_new , role , ATTR_CEXP )
end

--------------------------------------------------------------------------------------------------
--�������
--------------------------------------------------------------------------------------------------

--�������� ������ (ID 1815)
function ItemUse_HLBX ( role , Item )
	local item_type = BaoXiang_HLBX 
	local item_type_rad = BaoXiang_HLBX_Rad 
	local item_type_count = BaoXiang_HLBX_Count 
	local maxitem = BaoXiang_HLBX_Mxcount
	local item_quality = BaoXiang_HLBX_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end

	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	--local itemname = GetItemName ( ItemId ) 
	--local cha_name = GetChaDefaultName ( role ) 
	--local message = cha_name.." opens a treasure chest and obtained"..itemname  
	--Notice ( message )
end 

--����������� ������ (ID 1814)
function ItemUse_SMBX ( role , Item )
	local item_type = BaoXiang_SMBX 
	local item_type_rad = BaoXiang_SMBX_Rad 
	local item_type_count = BaoXiang_SMBX_Count 
	local maxitem = BaoXiang_SMBX_Mxcount						-- �ս���
	local item_quality = BaoXiang_SMBX_Qua
	local General = 0  
	local ItemId = 0 
	
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 

	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	--local itemname = GetItemName ( ItemId ) 
	--local cha_name = GetChaDefaultName ( role ) 
	--local message = cha_name.." opens a treasure chest and obtained"..itemname  
	--Notice ( message )
end 

--������� ������ (ID 1852)
function ItemUse_SYBOX ( role , Item )
	local item_type = BaoXiang_SYBOX 
	local item_type_rad = BaoXiang_SYBOX_Rad 
	local item_type_count = BaoXiang_SYBOX_Count 
	local maxitem = BaoXiang_SYBOX_Mxcount
	local item_quality = BaoXiang_SYBOX_Qua
	local General = 0  
	local ItemId = 0 
	
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 

	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	 if   ItemId >= 0183 and  ItemId <= 0199   then
	 
		local itemname = GetItemName ( ItemId ) 
		local cha_name = GetChaDefaultName ( role ) 
		local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
		--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
		--local message = cha_name.." opens a treasure chest and obtained   "..itemname  	
 		Notice ( message )
	end
end

--������ � ������ (ID 1851)
function ItemUse_WZX ( role , Item )
	local item_type = BaoXiang_WZX 
	local item_type_rad = BaoXiang_WZX_Rad 
	local item_type_count = BaoXiang_WZX_Count 
	local maxitem = BaoXiang_WZX_Mxcount
	local item_quality = BaoXiang_WZX_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 


	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
--	local itemname = GetItemName ( ItemId ) 
--	local cha_name = GetChaDefaultName ( role ) 
--	local message = cha_name.." opens a treasure chest and obtained"..itemname  
--	Notice ( message )
end

--��������� ������ ������� (ID 3400)
function ItemUse_KLJS ( role , Item )
	local item_type = BaoXiang_KLJS 
	local item_type_rad = BaoXiang_KLJS_Rad 
	local item_type_count = BaoXiang_KLJS_Count 
	local maxitem = BaoXiang_KLJS_Mxcount
	local item_quality = BaoXiang_KLJS_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 

	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end 

--��������� ������ �������� (ID 3401)
function ItemUse_KLLR ( role , Item )
	local item_type = BaoXiang_KLLR 
	local item_type_rad = BaoXiang_KLLR_Rad 
	local item_type_count = BaoXiang_KLLR_Count 
	local maxitem = BaoXiang_KLLR_Mxcount
	local item_quality = BaoXiang_KLLR_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 

	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname   
	Notice ( message )
end 

--��������� ������ �������� (ID 3402)
function ItemUse_KLYS ( role , Item )
	local item_type = BaoXiang_KLYS 
	local item_type_rad = BaoXiang_KLYS_Rad 
	local item_type_count = BaoXiang_KLYS_Count 
	local maxitem = BaoXiang_KLYS_Mxcount
	local item_quality = BaoXiang_KLYS_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 

	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname   
	Notice ( message )
end

--��������� ������ ������������� (ID 3403)
function ItemUse_KLMX ( role , Item )
	local item_type = BaoXiang_KLMX 
	local item_type_rad = BaoXiang_KLMX_Rad 
	local item_type_count = BaoXiang_KLMX_Count 
	local maxitem = BaoXiang_KLMX_Mxcount
	local item_quality = BaoXiang_KLMX_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 

	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname    
	Notice ( message )
end

--������ ���������� ������� (ID 3404)
function ItemUse_ZSSJ ( role , Item )
	local item_type = BaoXiang_ZSSJ 
	local item_type_rad = BaoXiang_ZSSJ_Rad 
	local item_type_count = BaoXiang_ZSSJ_Count 
	local maxitem = BaoXiang_ZSSJ_Mxcount
	local item_quality = BaoXiang_ZSSJ_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 

	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname    
	Notice ( message )
end

--������ ���������� �������� (ID 3405)
function ItemUse_ZSJS ( role , Item )
	local item_type = BaoXiang_ZSJS 
	local item_type_rad = BaoXiang_ZSJS_Rad 
	local item_type_count = BaoXiang_ZSJS_Count 
	local maxitem = BaoXiang_ZSJS_Mxcount
	local item_quality = BaoXiang_ZSJS_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 

	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname 
	Notice ( message )
end

--������ ���������� ������� (ID 3406)
function ItemUse_ZSJJ ( role , Item )
	local item_type = BaoXiang_ZSJJ
	local item_type_rad = BaoXiang_ZSJJ_Rad 
	local item_type_count = BaoXiang_ZSJJ_Count 
	local maxitem = BaoXiang_ZSJJ_Mxcount
	local item_quality = BaoXiang_ZSJJ_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 

	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname 
	Notice ( message )
end

--������ ���������� ������������ (ID 3407)
function ItemUse_ZSSZ ( role , Item )
	local item_type = BaoXiang_ZSSZ
	local item_type_rad = BaoXiang_ZSSZ_Rad 
	local item_type_count = BaoXiang_ZSSZ_Count 
	local maxitem = BaoXiang_ZSSZ_Mxcount
	local item_quality = BaoXiang_ZSSZ_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1	
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 

	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname 
	Notice ( message )
end

--������ ���������� �������� (ID 3408)
function ItemUse_ZSFY ( role , Item )
	local item_type = BaoXiang_ZSFY
	local item_type_rad = BaoXiang_ZSFY_Rad 
	local item_type_count = BaoXiang_ZSFY_Count 
	local maxitem = BaoXiang_ZSFY_Mxcount
	local item_quality = BaoXiang_ZSFY_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 

	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end

--C����� ���������� ������������� (ID 3409)
function ItemUse_ZSHH ( role , Item )
	local item_type = BaoXiang_ZSHH
	local item_type_rad = BaoXiang_ZSHH_Rad 
	local item_type_count = BaoXiang_ZSHH_Count 
	local maxitem = BaoXiang_ZSHH_Mxcount
	local item_quality = BaoXiang_ZSHH_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end

--���������� ������ ������� (ID 3410)
function ItemUse_HLSJ ( role , Item )
	local item_type = BaoXiang_HLSJ
	local item_type_rad = BaoXiang_HLSJ_Rad 
	local item_type_count = BaoXiang_HLSJ_Count 
	local maxitem = BaoXiang_HLSJ_Mxcount
	local item_quality = BaoXiang_HLSJ_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname   
	Notice ( message )
end

--������ ������������ �������� (ID 3411)
function ItemUse_HLJS ( role , Item )
	local item_type = BaoXiang_HLJS
	local item_type_rad = BaoXiang_HLJS_Rad 
	local item_type_count = BaoXiang_HLJS_Count 
	local maxitem = BaoXiang_HLJS_Mxcount
	local item_quality = BaoXiang_HLJS_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname     
	Notice ( message )
end

--������ ������������ ������� (ID 3412)
function ItemUse_HLJJ ( role , Item )
	local item_type = BaoXiang_HLJJ
	local item_type_rad = BaoXiang_HLJJ_Rad 
	local item_type_count = BaoXiang_HLJJ_Count 
	local maxitem = BaoXiang_HLJJ_Mxcount
	local item_quality = BaoXiang_HLJJ_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname 
	Notice ( message )
end

--���������� ������ ������������ (ID 3413)
function ItemUse_HLSZ ( role , Item )
	local item_type = BaoXiang_HLSZ
	local item_type_rad = BaoXiang_HLSZ_Rad 
	local item_type_count = BaoXiang_HLSZ_Count 
	local maxitem = BaoXiang_HLSZ_Mxcount
	local item_quality = BaoXiang_HLSZ_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end

--������ ������������ �������� (ID 3414)
function ItemUse_HLFY ( role , Item )
	local item_type = BaoXiang_HLFY
	local item_type_rad = BaoXiang_HLFY_Rad 
	local item_type_count = BaoXiang_HLFY_Count 
	local maxitem = BaoXiang_HLFY_Mxcount
	local item_quality = BaoXiang_HLFY_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname 
	Notice ( message )
end

--������ ������������ ������������� (ID 3415)
function ItemUse_HLHH ( role , Item )
	local item_type = BaoXiang_HLHH
	local item_type_rad = BaoXiang_HLHH_Rad 
	local item_type_count = BaoXiang_HLHH_Count 
	local maxitem = BaoXiang_HLHH_Mxcount
	local item_quality = BaoXiang_HLHH_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end

--�������� ������ ������� (ID 3416)
function ItemUse_MSJ ( role , Item )
	local item_type = BaoXiang_MSJ
	local item_type_rad = BaoXiang_MSJ_Rad 
	local item_type_count = BaoXiang_MSJ_Count 
	local maxitem = BaoXiang_MSJ_Mxcount
	local item_quality = BaoXiang_MSJ_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname    
	Notice ( message )
end

--������������ ������ �������� (ID 3417)
function ItemUse_MJS ( role , Item )
	local item_type = BaoXiang_MJS
	local item_type_rad = BaoXiang_MJS_Rad 
	local item_type_count = BaoXiang_MJS_Count 
	local maxitem = BaoXiang_MJS_Mxcount
	local item_quality = BaoXiang_MJS_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname    
	Notice ( message )
end

--������������ ������ ������� (ID 3418)
function ItemUse_MJJ ( role , Item )
	local item_type = BaoXiang_MJJ
	local item_type_rad = BaoXiang_MJJ_Rad 
	local item_type_count = BaoXiang_MJJ_Count 
	local maxitem = BaoXiang_MJJ_Mxcount
	local item_quality = BaoXiang_MJJ_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest"
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname     
	Notice ( message )
end

--������������ ������ ������� (ID 3419)
function ItemUse_MSZ ( role , Item )
	local item_type = BaoXiang_MSZ
	local item_type_rad = BaoXiang_MSZ_Rad 
	local item_type_count = BaoXiang_MSZ_Count 
	local maxitem = BaoXiang_MSZ_Mxcount
	local item_quality = BaoXiang_MSZ_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest"
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname     
	Notice ( message )
end

--������������ ������ �������� (ID 3420)
function ItemUse_MFY ( role , Item )
	local item_type = BaoXiang_MFY
	local item_type_rad = BaoXiang_MFY_Rad 
	local item_type_count = BaoXiang_MFY_Count 
	local maxitem = BaoXiang_MFY_Mxcount
	local item_quality = BaoXiang_MFY_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest"
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname   
	Notice ( message )
end

--������������ ������ ���������� ����� (ID 3421)
function ItemUse_MHH ( role , Item )
	local item_type = BaoXiang_MHH
	local item_type_rad = BaoXiang_MHH_Rad 
	local item_type_count = BaoXiang_MHH_Count 
	local maxitem = BaoXiang_MHH_Mxcount
	local item_quality = BaoXiang_MHH_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest"
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname    
	Notice ( message )
end

--������ �� ����������� ������ (ID 3422)
function ItemUse_FLBX ( role , Item )
	local item_type = BaoXiang_FLBX
	local item_type_rad = BaoXiang_FLBX_Rad 
	local item_type_count = BaoXiang_FLBX_Count 
	local maxitem = BaoXiang_FLBX_Mxcount
	local item_quality = BaoXiang_FLBX_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest"
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname     
	Notice ( message )
end

--������ � ������ ���� (ID 3423)
function ItemUse_ZZBX ( role , Item )
	local item_type = BaoXiang_ZZBX
	local item_type_rad = BaoXiang_ZZBX_Rad 
	local item_type_count = BaoXiang_ZZBX_Count 
	local maxitem = BaoXiang_ZZBX_Mxcount
	local item_quality = BaoXiang_ZZBX_Qua
	local General = 0  
	local ItemId = 0 
	
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest"
		UseItemFailed ( role )
		return
	end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname   
	Notice ( message )
end

--������ �� ���� ������� (ID 3424)
function ItemUse_MFBX ( role , Item )
	local item_type = BaoXiang_MFBX
	local item_type_rad = BaoXiang_MFBX_Rad 
	local item_type_count = BaoXiang_MFBX_Count 
	local maxitem = BaoXiang_MFBX_Mxcount
	local item_quality = BaoXiang_MFBX_Qua
	local General = 0  
	local ItemId = 0 
	
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest"
		UseItemFailed ( role )
		return
	end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end

--������ ���������� (ID 3458)
function ItemUse_MZBX ( role , Item )
	local item_type = BaoXiang_MZBX
	local item_type_rad = BaoXiang_MZBX_Rad 
	local item_type_count = BaoXiang_MZBX_Count 
	local maxitem = BaoXiang_MZBX_Mxcount
	local item_quality = BaoXiang_MZBX_Qua
	local General = 0  
	local ItemId = 0 
	
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest"
		UseItemFailed ( role )
		return
	end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break 
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \241\243\237\228\243\234 \241 \241\238\234\240\238\226\232\249\224\236\232 \232 \239\238\235\243\247\224\229\242   "..itemname  
	--local message = cha_name.." ��������� ������ � ����������� � ��������   "..itemname 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname    
	Notice ( message )
end

--------------------------------------------------------------------------------------------------
--������������
--------------------------------------------------------------------------------------------------

--������� ���� (ID 3459)
function  ItemUse_BOMB ( role , Item ) 
	local bomb = SummonCha ( role , 1 , 704 ) 
	local statetime = 10 
	local statelv = 1 
	AddState ( role , bomb , STATE_BOMB , statelv , statetime ) 
	AddChaSkill ( bomb , SK_BOMB , 1 , 1 , 0 ) 
	SystemNotice ( role , "\194\238\228\255\237\224\255 \236\232\237\224 \243\241\239\229\248\237\238 \243\241\242\224\237\238\226\235\229\237\224" ) 
	--SystemNotice ( role , "������� ���� ������� �����������" ) 
	--SystemNotice ( role , "mount Water Mine successful" ) 
end 


--------------------------------------------------------------------------------------------------
--�����
--------------------------------------------------------------------------------------------------

--����� ����� (ID 1854)
function ItemUse_PKMNYS ( role , Item )
	local statelv = 10
	local statetime = 1800
	AddState( role , role , STATE_PKMNYS , statelv , statetime )
end


--������ ����� (ID 1855)
function ItemUse_PKZDYS ( role , Item )
	local statelv = 10
	local statetime = 150
	AddState( role , role , STATE_PKZDYS , statelv , statetime )
end

--����� �������� (ID 1856)
function ItemUse_PKKBYS ( role , Item )
	local statelv = 10
	local statetime = 30
	AddState( role , role , STATE_PKKBYS , statelv , statetime )
end

--����������� (ID 1857)
function ItemUse_PKJSYS ( role , Item )
	local statelv = 10
	local statetime = 180
	AddState( role , role , STATE_PKJSYS , statelv , statetime )
end

--����������� ����� (ID 1858)
function ItemUse_PKSFYS ( role , Item )
	local statelv = 10
	local statetime = 300
	AddState( role , role , STATE_PKSFYS , statelv , statetime )
end

--����� �������� (ID 1859)
function ItemUse_PKJZYS ( role , Item )
	local statelv = 10
	local statetime = 900
	AddState( role , role , STATE_PKJZYS , statelv , statetime )
end

--���������� (ID n\a)
function ItemUse_PKWDYS ( role , Item )
	local statelv = 10
	local statetime = 15
	AddState( role , role , STATE_PKWD , statelv , statetime )
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \241\242\224\237\238\226\232\242\241\255 \205\229\232\231\226\229\241\242\237\206 \237\224 15 \241\229\234\243\237\228" 
	--local message = cha_name.." ���������� ���������� �� 15 ������" 
	--local message = cha_name.." becomes invunerable for 15 seconds" 
	Notice ( message )
end

--������������ ����������� ��� (ID 1861)
function ItemUse_PKMCK ( role , Item )
	local map_name = GetChaMapName ( role )
	if map_name == "secretgarden" then
		local hpdmg = -500   
		Hp_Endure_Dmg ( role , hpdmg ) 
		ALLExAttrSet(role)
	else
		SystemNotice ( role , "\221\242\238\242 \239\240\229\228\236\229\242 \236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \242\238\235\252\234\238 \226 \209\224\228\243 \221\228\229\235\252" )
		--SystemNotice ( role , "���� ������� ����� ������������ ������ � ���� �����" )
		--SystemNotice ( role , "Item can only be used in Garden of Edel" )
	end
end



--------------------------------------------------------------------------------------------------
--������
--------------------------------------------------------------------------------------------------

--������� � ��������� ID 3048)
function Jz_Script_ltcs(role, Item )
	local i = CheckBagItem(role,3828)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3828,1)
			if j == 1 then
				MoveCity(role,"Thundoria Castle")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end


--������ � ���� ���������� (ID 3049)
function Jz_Script_ltjgcs(role, Item )
	local i = CheckBagItem(role,3829)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3829,1)
			if j == 1 then
				MoveCity(role,"Thundoria Harbor")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end


--������� � ��������� ������� ���� (ID 3050)
function Jz_Script_sxscs(role, Item )
	local i = CheckBagItem(role,3830)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3830,1)
			if j == 1 then
				MoveCity(role,"Sacred Snow Mountain")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� � ��������� ��� (ID 3051)
function Jz_Script_laslcs(role, Item )
	local i = CheckBagItem(role,3831)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3831,1)
			if j == 1 then
				MoveCity(role,"Andes Forest Haven")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� � ����� (ID 3052)
function Jz_Script_sqcs(role, Item )
	local i = CheckBagItem(role,3832)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3832,1)
			if j == 1 then
				MoveCity(role,"Oasis Haven")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� � �������� ���� (ID 3053)
function Jz_Script_bjcs(role, Item )
	local i = CheckBagItem(role,3833)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3833,1)
			if j == 1 then
				MoveCity(role,"Icespire Haven")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� � �������� ����� (ID 3054)
function Jz_Script_jmztcs(role, Item )
	local i = CheckBagItem(role,3834)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3834,1)
			if j == 1 then
				MoveCity(role,"Lone Tower Entrace")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--����� ������ (ID 3055)
function Jz_Script_scrkcs(role, Item )
	local i = CheckBagItem(role,3835)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3835,1)
			if j == 1 then
				MoveCity(role,"Barren Cavern Entrance")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������ � ����������� ����� 2 (ID 3056)
function Jz_Script_fk2cs(role, Item )
	local i = CheckBagItem(role,3836)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3836,1)
			if j == 1 then
				MoveCity(role,"Abandon Mine 2")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� � ���������� ����� 2 (ID 3057)
function Jz_Script_yk2cs(role, Item )
	local i = CheckBagItem(role,3837)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3837,1)
			if j == 1 then
				MoveCity(role,"Silver Mine 2")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� � ���������� ����� 3 (ID 3058)
function Jz_Script_yk3cs(role, Item )
	local i = CheckBagItem(role,3838)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3838,1)
			if j == 1 then
				MoveCity(role,"Silver Mine 3")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--����� � �������� ����� 2 (ID 3059)
function Jz_Script_jmzt2cs(role, Item )
	local i = CheckBagItem(role,3839)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3839,1)
			if j == 1 then
				MoveCity(role,"Lone Tower 2")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� � �������� ����� 3 (ID 3060)
function Jz_Script_jmzt3cs(role, Item )
	local i = CheckBagItem(role,3840)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3840,1)
			if j == 1 then
				MoveCity(role,"Lone Tower 3")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� � �������� ����� 4 (ID 3070)
function Jz_Script_jmzt4cs(role, Item )
	local i = CheckBagItem(role,3841)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3841,1)
			if j == 1 then
				MoveCity(role,"Lone Tower 4")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� � �������� ����� 5 (ID 3071)
function Jz_Script_jmzt5cs(role, Item )
	local i = CheckBagItem(role,3842)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3842,1)
			if j == 1 then
				MoveCity(role,"Lone Tower 5")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� � �������� ����� 6 (ID 3072)
function Jz_Script_jmzt6cs(role, Item )
	local i = CheckBagItem(role,3843)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3843,1)
			if j == 1 then
				MoveCity(role,"Lone Tower 6")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� � ����������� ����� 1 (ID 3073)
function Jz_Script_fk1cs(role, Item )
	local i = CheckBagItem(role,3847)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3847,1)
			if j == 1 then
				MoveCity(role,"Abandon Mine 1")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--------------------------------------------------------------------------------------------------
--��, ���, ��� � ��������� ��������� ������
--------------------------------------------------------------------------------------------------

--�������� ����� (ID )
function ItemUse_MoreExpGz( role , Item )
	local statelv = 1
	local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
	 local name = GetChaDefaultName(role)
	if DropEXP[name] == nil then
        DropEXP[name] = { UsedTime = os.time() }
    end
	if ChaStateLv > statelv then --���� ������� ����� ������ ������ ��� �����������
		SystemNotice ( role , "����� ������ ��������� ����� ��� �� ��������� " )
		UseItemFailed ( role )
		return
	end
local cooldown = DropEXP[name].UsedTime - os.time()
	if ChaStateLv == statelv then
		 if cooldown > 0 then
local cooldown2 = math.floor(cooldown/60)		 		
local cooldown1 = (cooldown - math.floor(cooldown/60)*60)		 
        SystemNotice(role,"�������� ����� ��� �������, �������� ������������ ����� ����� "..cooldown2.." ����� "..cooldown1.." ���.!")
		UseItemFailed ( role )
		return
	end
end
	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBJYGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBJYGZ , statelv , statetime )
	end
	DropEXP[name].UsedTime = os.time()+900
	SystemNotice ( role ,"�������� ����� ������������ " )
end

--����� ����� ������ (ID 0849)
function ItemUse_ZD_MoreExpGz( role , Item )
	local statelv = 1
	local ChaStateLv = GetChaStateLv ( role , STATE_ZDSBJYGZ )

	if ChaStateLv > statelv then
		SystemNotice ( role , "\207\240\229\228\236\229\242 \243\230\229 \232\241\239\238\235\252\231\243\229\242\241\255. \207\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		UseItemFailed ( role )
		return
	end

	local statetime = 600
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_ZDSBJYGZ , statelv , statetime )
		EffectPanel_Add(role, "STATE_ZDSBJYGZ", statelv, "n1405", EffectPanel_TimeConvertor(statetime))
	else
		AddState( Cha_Boat , Cha_Boat , STATE_ZDSBJYGZ , statelv , statetime )
		EffectPanel_Add(role, "STATE_ZDSBJYGZ", statelv, "n1397", EffectPanel_TimeConvertor(statetime))
	end
    SystemNotice ( role ,"\206\239\251\242 \234\238\236\224\237\228\251 \243\226\229\235\232\247\229\237 \226 1.5 \240\224\231\224 " )
	local effect = 888              -- ID ������� �� sceneffectinfo.txt
    PlayEffect (role, effect )      -- ���������� ����������� ������ ��� �������� �������
end

--����� ��� ����� (ID 1006)
function ItemUse_MoreItemGz( role , Item )
	local statelv = 1
	local ChaStateLv = GetChaStateLv ( role , STATE_SBBLGZ )
	
	if ChaStateLv > statelv then
		SystemNotice ( role , "\207\240\229\228\236\229\242 \243\230\229 \232\241\239\238\235\252\231\243\229\242\241\255. \207\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "������� ��� ������������. ���������� �����" )
		--SystemNotice ( role , "Better fruit in effect. Please use it later" )
		UseItemFailed ( role )
		return
	end
	
	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBBLGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBBLGZ , statelv , statetime )
	end
end

--������ ���������� (ID 3879)
function ItemUse_MoreExpGzLv2( role , Item )
	local Lv = Lv( role )
	if Lv < 40 then
		SystemNotice(role ,"\210\238\235\252\234\238 \232\227\240\238\234\232 \243\240\238\226\237\255 40 \232 \226\251\248\229 \236\238\227\243\242 \232\241\239\238\235\252\231\238\226\224\242\252 \253\242\238\242 \239\240\229\228\236\229\242")
		--SystemNotice(role ,"������ ������ ������ 40 � ���� ����� ������������ ���� �������")
		--SystemNotice(role ,"Only players Lv 40 and above may use")
		UseItemFailed ( role )
		return
	end

	local statelv = 2
	
	local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
	
	if ChaStateLv > statelv then
		SystemNotice ( role , "\207\240\229\228\236\229\242 \243\230\229 \232\241\239\238\235\252\231\243\229\242\241\255. \207\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "������� ��� ������������. ���������� �����" )
		--SystemNotice ( role , "Better fruit in effect. Please use it later" )
		UseItemFailed ( role )
		return
	end
	
	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBJYGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBJYGZ , statelv , statetime )
	end
	SystemNotice ( role ,"Feel the effect of Special Mystic Fruit" )
end

--������ �������-����� (ID 3881)
function ItemUse_MoreItemGzLv2( role , Item )
	local Lv = Lv( role )
	if Lv < 40 then
		SystemNotice(role ,"\210\238\235\252\234\238 \232\227\240\238\234\232 \243\240\238\226\237\255 40 \232 \226\251\248\229 \236\238\227\243\242 \232\241\239\238\235\252\231\238\226\224\242\252 \253\242\238\242 \239\240\229\228\236\229\242")
		--SystemNotice(role ,"������ ������ ������ 40 � ���� ����� ������������ ���� �������")
		--SystemNotice(role ,"Only players Lv 40 and above may use")
		UseItemFailed ( role )
		return
	end


	local statelv = 2
	local ChaStateLv = GetChaStateLv ( role , STATE_SBBLGZ )
	
	if ChaStateLv > statelv then
		SystemNotice ( role , "\207\240\229\228\236\229\242 \243\230\229 \232\241\239\238\235\252\231\243\229\242\241\255. \207\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "������� ��� ������������. ���������� �����" )
		--SystemNotice ( role , "Better fruit in effect. Please use it later" )
		UseItemFailed ( role )
		return
	end

	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBBLGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBBLGZ , statelv , statetime )
	end
	SystemNotice ( role ,"Feels the effect of Special Lucky Fruit" )
end

--����� ��������� ���������� (ID 3095)
function ItemUse_MoreExpGzLv3( role , Item )
	local Lv = Lv( role )
	if Lv < 60 then
		SystemNotice(role ,"\210\238\235\252\234\238 \232\227\240\238\234\232 \243\240\238\226\237\255 60 \232 \226\251\248\229 \236\238\227\243\242 \232\241\239\238\235\252\231\238\226\224\242\252 \253\242\238\242 \239\240\229\228\236\229\242")
		--SystemNotice(role ,"������ ������ ������ 60 � ���� ����� ������������ ���� �������")
		--SystemNotice(role ,"Only players Lv 60 and above may use")
		UseItemFailed ( role )
		return
	end

	local statelv = 5
	
	local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
	
	if ChaStateLv > statelv then
		SystemNotice ( role , "\207\240\229\228\236\229\242 \243\230\229 \232\241\239\238\235\252\231\243\229\242\241\255. \207\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "������� ��� ������������. ���������� �����" )
		--SystemNotice ( role , "Better fruit in effect. Please use it later" )
		UseItemFailed ( role )
		return
	end
	
	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBJYGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBJYGZ , statelv , statetime )
	end
	SystemNotice ( role ,"\207\238\247\243\226\241\242\226\243\233 \253\244\244\229\234\242 \238\242 \209\243\239\229\240 \211\241\232\235\232\242\235\255 \209\242\240\229\236\235\229\237\232\233" )
	SystemNotice ( role ,"���������� ������ �� ����� �������� ����������" )
	SystemNotice ( role ,"Feel the effect of Super Lucky Fruit" )
end

--������� ��������� ����� (ID 3097)
function ItemUse_MoreItemGzLv3( role , Item )
	local Lv = Lv( role )
	if Lv < 60 then
		SystemNotice(role ,"\210\238\235\252\234\238 \232\227\240\238\234\232 \243\240\238\226\237\255 60 \232 \226\251\248\229 \236\238\227\243\242 \232\241\239\238\235\252\231\238\226\224\242\252 \253\242\238\242 \239\240\229\228\236\229\242")
		--SystemNotice(role ,"������ ������ ������ 60 � ���� ����� ������������ ���� �������")
		--SystemNotice(role ,"Only players Lv 60 and above may use")
		UseItemFailed ( role )
		return
	end


	local statelv = 5	
	
	local ChaStateLv = GetChaStateLv ( role , STATE_SBBLGZ )
	
	if ChaStateLv > statelv then
		SystemNotice ( role , "\207\240\229\228\236\229\242 \243\230\229 \232\241\239\238\235\252\231\243\229\242\241\255. \207\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "������� ��� ������������. ���������� �����" )
		--SystemNotice ( role , "Better fruit in effect. Please use it later" )
		UseItemFailed ( role )
		return
	end

	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBBLGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBBLGZ , statelv , statetime )
	end
	SystemNotice ( role ,"\207\238\247\243\226\241\242\226\243\233 \253\244\244\229\234\242 \238\242 \193\238\235\252\248\238\227\238 \211\241\232\235\232\242\229\235\255 \211\228\224\247\232" )
	--SystemNotice ( role ,"���������� ������ �� �������� ��������� �����" )
	--SystemNotice ( role ,"Feel the effect of Super Lucky Fruit" )
end

--��������� ����� (ID 0898)
function ItemUse_MoreItemAndExpGz( role , Item )
	local Lv = Lv( role )
	if Lv < 30 then
		SystemNotice(role ,"\210\238\235\252\234\238 \232\227\240\238\234\232 \243\240\238\226\237\255 30 \232 \226\251\248\229 \236\238\227\243\242 \232\241\239\238\235\252\231\238\226\224\242\252 \253\242\238\242 \239\240\229\228\236\229\242")
		--SystemNotice(role ,"������ ������ ������ 30 � ���� ����� ������������ ���� �������")
		--SystemNotice(role ,"Only players Lv 30 and above may use")
		UseItemFailed ( role )
		return
	end

	local statelv = 1
	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBJYGZ , statelv , statetime )
		AddState( role , role , STATE_SBBLGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBJYGZ , statelv , statetime )
		AddState( Cha_Boat , Cha_Boat , STATE_SBBLGZ , statelv , statetime )
	end
end

--------------------------------------------------------------------------------------------------
--����� ������ ������
--------------------------------------------------------------------------------------------------

--����� �������������� ������������ (ID 3098)
function ItemUse_TLHFJ( role , Item )
	local hp = GetChaAttr(role, ATTR_HP) 
	hp_resume = 800 
	
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then 
		hp = mxhp 
	end 
	SetCharaAttr(hp, role, ATTR_HP)
end

--�������������� ����� ���� (ID 0899)
function ItemUse_XD_Str1 ( role , Item )
	local str = GetChaAttr( role , ATTR_BSTR )
	local ap = GetChaAttr( role , ATTR_AP )
--	SystemNotice ( role , "strength before edit is"..str )
--	SystemNotice ( role , "attribute before editing is"..ap )
	if str <= 5 then 
		SystemNotice ( role , "\211 \194\224\241 \237\229\242 \241\226\238\225\238\228\237\251\245 \238\247\234\238\226 \245\224\240\224\234\242\229\240\232\241\242\232\234. \209\225\240\238\241 \237\229\226\238\231\236\238\230\229\237" )
		--SystemNotice ( role , "� ��� ��� ��������� ����� �������������. ����� ����������" )
		--SystemNotice ( role , "You do not have enough points to reset. Reset failed" )
		UseItemFailed ( role )
		return
	end
	local str_dif = 1
	local ap_dif = 1
	str = str - str_dif
	ap = ap + 1

	SystemNotice ( role , "\193\251\235\238 \241\225\240\238\248\229\237\238 1 \238\247\234\238 \241\232\235\251" )
	--SystemNotice ( role , "���� �������� 1 ���� ����" )
	--SystemNotice ( role , "Reset 1 Strength point to increases 1 stat point" )
	
	
--	SystemNotice ( role , "strength before edit is"..str )
--	SystemNotice ( role , "attribute point edited as"..ap )
	SetCharaAttr ( str , role , ATTR_BSTR )
	SetCharaAttr ( ap , role , ATTR_AP )
end

--����� ������ ������������ (ID 0900)
function ItemUse_XD_Con1 ( role , Item )
	local con = GetChaAttr( role , ATTR_BCON )
	local ap = GetChaAttr( role , ATTR_AP )
--	SystemNotice ( role , "constitution before edit is"..con )
--	SystemNotice ( role , "attribute before editing is"..ap )
	if con <= 5 then 
		SystemNotice ( role , "\211 \194\224\241 \237\229\242 \241\226\238\225\238\228\237\251\245 \238\247\234\238\226 \245\224\240\224\234\242\229\240\232\241\242\232\234. \209\225\240\238\241 \237\229\226\238\231\236\238\230\229\237" )
		--SystemNotice ( role , "� ��� ��� ��������� ����� �������������. ����� ����������" )
		--SystemNotice ( role , "You do not have enough points to reset. Reset failed" )
		UseItemFailed ( role )
		return
	end
	local con_dif = 1
	local ap_dif = 1
	con = con - con_dif
	ap = ap + 1

	SystemNotice ( role , "\193\251\235\238 \241\225\240\238\248\229\237\238 1 \238\247\234\238 \242\229\235\238\241\235\238\230\229\237\232\255" )
	--SystemNotice ( role , "���� �������� 1 ���� ������������" )
	--SystemNotice ( role , "Reset 1 Constitution point to increase 1 Stat point" )
	
	
--	SystemNotice ( role , "constitution edited to"..con )
--	SystemNotice ( role , "attribute point edited as"..ap )
	SetCharaAttr ( con , role , ATTR_BCON )
	SetCharaAttr ( ap , role , ATTR_AP )
end

--�������������� ����� �������� (ID 0901)
function ItemUse_XD_Agi1 ( role , Item )
	local agi = GetChaAttr( role , ATTR_BAGI )
	local ap = GetChaAttr( role , ATTR_AP )
--	SystemNotice ( role , "agility before edit is"..agi )
--	SystemNotice ( role , "attribute before editing is"..ap )
	if agi <= 5 then 
		SystemNotice ( role , "\211 \194\224\241 \237\229\242 \241\226\238\225\238\228\237\251\245 \238\247\234\238\226 \245\224\240\224\234\242\229\240\232\241\242\232\234. \209\225\240\238\241 \237\229\226\238\231\236\238\230\229\237" )
		--SystemNotice ( role , "� ��� ��� ��������� ����� �������������. ����� ����������" )
		--SystemNotice ( role , "You do not have enough points to reset. Reset failed" )
		UseItemFailed ( role )
		return
	end
	local agi_dif = 1
	local ap_dif = 1
	agi = agi - agi_dif
	ap = ap + 1
	
	SystemNotice ( role , "\193\251\235\238 \241\225\240\238\248\229\237\238 1 \238\247\234\238 \235\238\226\234\238\241\242\232" )
	--SystemNotice ( role , "���� �������� 1 ���� ��������" )
	--SystemNotice ( role , "Reset 1 Agility point to increases 1 stat point" )
	
--	SystemNotice ( role , "Agility edited to"..agi )
--	SystemNotice ( role , "attribute point edited as"..ap )
	SetCharaAttr ( agi , role , ATTR_BAGI )
	SetCharaAttr ( ap , role , ATTR_AP )
end

--����� �������������� �������� (ID 0902)
function ItemUse_XD_Dex1 ( role , Item )
	local dex = GetChaAttr( role , ATTR_BDEX )
	local ap = GetChaAttr( role , ATTR_AP )
--	SystemNotice ( role , "Accuracy edited to"..dex )
--	SystemNotice ( role , "attribute before editing is"..ap )
	if dex <= 5 then 
		SystemNotice ( role , "\211 \194\224\241 \237\229\242 \241\226\238\225\238\228\237\251\245 \238\247\234\238\226 \245\224\240\224\234\242\229\240\232\241\242\232\234. \209\225\240\238\241 \237\229\226\238\231\236\238\230\229\237" )
		--SystemNotice ( role , "� ��� ��� ��������� ����� �������������. ����� ����������" )
		--SystemNotice ( role , "You do not have enough points to reset. Reset failed" )
		UseItemFailed ( role )
		return
	end
	local dex_dif = 1
	local ap_dif = 1
	dex = dex - dex_dif
	ap = ap + 1
	
	SystemNotice ( role , "\193\251\235\238 \241\225\240\238\248\229\237\238 1 \238\247\234\238 \242\238\247\237\238\241\242\232" )
	--SystemNotice ( role , "���� �������� 1 ���� ��������" )
	--SystemNotice ( role , "Reset 1 Accuracy point to increase 1 Stat point" )
	
--	SystemNotice ( role , "accuracy edit as"..dex )
--	SystemNotice ( role , "attribute point edited as"..ap )
	SetCharaAttr ( dex , role , ATTR_BDEX )
	SetCharaAttr ( ap , role , ATTR_AP )
end

--����� ������ ���� (ID 0903)
function ItemUse_XD_Sta1 ( role , Item )
	local sta = GetChaAttr( role , ATTR_BSTA )
	local ap = GetChaAttr( role , ATTR_AP )
--	SystemNotice ( role , "spirit before edit is"..sta )
--	SystemNotice ( role , "attribute before editing is"..ap )
	if sta <= 5 then 
		SystemNotice ( role , "\211 \194\224\241 \237\229\242 \241\226\238\225\238\228\237\251\245 \238\247\234\238\226 \245\224\240\224\234\242\229\240\232\241\242\232\234. \209\225\240\238\241 \237\229\226\238\231\236\238\230\229\237" )
		--SystemNotice ( role , "� ��� ��� ��������� ����� �������������. ����� ����������" )
		--SystemNotice ( role , "You do not have enough points to reset. Reset failed" )
		UseItemFailed ( role )
		return
	end
	local sta_dif = 1
	local ap_dif = 1
	sta = sta - sta_dif
	ap = ap + 1

	SystemNotice ( role , "\193\251\235\238 \241\225\240\238\248\229\237\238 1 \238\247\234\238 \228\243\245\224" )
	--SystemNotice ( role , "���� �������� 1 ���� ����" )
	--SystemNotice ( role , "Reset 1 Spirit point to increase 1 Stat point" )
	
--	SystemNotice ( role , "Spirit edited as "..sta )
--	SystemNotice ( role , "attribute point edited as"..ap )
	SetCharaAttr ( sta , role , ATTR_BSTA )
	SetCharaAttr ( ap , role , ATTR_AP )
end

--------------------------------------------------------------------------------------------------
--�������� ���������� �����
--------------------------------------------------------------------------------------------------

--�������  �������� (ID 3101)
function ItemUse_SPLhyj( role , Item )
	local OtherStateLv = 0
	local i = 0
	local State_Num = 3
	local State = {}
	State [0] = GetChaStateLv ( role , STATE_YSLQQH )
	State [1] = GetChaStateLv ( role , STATE_YSTZQH )
	State [2] = GetChaStateLv ( role , STATE_YSJSQH )
	State [3] = GetChaStateLv ( role , STATE_YSLLQH )

	for i = 0 , State_Num , 1 do
		if State[i] >= 1 then
			OtherStateLv = OtherStateLv + 1
		end
	end



	if OtherStateLv > 0 then
		SystemNotice(role ,"\221\244\244\229\234\242\251 \238\242 \228\240\243\227\232\245 \231\229\235\232\233 \237\229 \241\238\247\232\242\224\254\242\241\255")
		--SystemNotice(role ,"������� �� ������ ����� �� ����������")
		--SystemNotice(role ,"Potions effect for attribute bonus cannot be stacked")
		UseItemFailed ( role )
		return
	end
	
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		
		UseItemFailed ( role )
		return
	end

	local statelv = 1
	local statetime = 3600
	AddState( role , role , STATE_YSMJQH , statelv , statetime )

end

--������� ���� (ID 3103)
function ItemUse_SPYyyj( role , Item )
	local OtherStateLv = 0
	local i = 0
	local State_Num = 3
	local State = {}
	State [0] = GetChaStateLv ( role , STATE_YSMJQH )
	State [1] = GetChaStateLv ( role , STATE_YSTZQH )
	State [2] = GetChaStateLv ( role , STATE_YSJSQH )
	State [3] = GetChaStateLv ( role , STATE_YSLLQH )

	for i = 0 , State_Num , 1 do
		if State[i] >= 1 then
			OtherStateLv = OtherStateLv + 1
		end
	end



	if OtherStateLv > 0 then
		SystemNotice(role ,"\221\244\244\229\234\242\251 \238\242 \228\240\243\227\232\245 \231\229\235\232\233 \237\229 \241\238\247\232\242\224\254\242\241\255")
		--SystemNotice(role ,"������� �� ������ ����� �� ����������")
		--SystemNotice(role ,"Potions effect for attribute bonus cannot be stacked")
		UseItemFailed ( role )
		return
	end

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end


	local statelv = 1
	local statetime = 3600
	AddState( role , role , STATE_YSLQQH , statelv , statetime )

end

--����� ���� (ID 0895)
function ItemUse_SPMnyj( role , Item )
	
	local OtherStateLv = 0
	local i = 0
	local State_Num = 3
	local State = {}
	State [0] = GetChaStateLv ( role , STATE_YSMJQH )
	State [1] = GetChaStateLv ( role , STATE_YSLQQH )
	State [2] = GetChaStateLv ( role , STATE_YSJSQH )
	State [3] = GetChaStateLv ( role , STATE_YSLLQH )

	for i = 0 , State_Num , 1 do
		if State[i] >= 1 then
			OtherStateLv = OtherStateLv + 1
		end
	end



	if OtherStateLv > 0 then
		SystemNotice(role ,"\221\244\244\229\234\242\251 \238\242 \228\240\243\227\232\245 \231\229\235\232\233 \237\229 \241\238\247\232\242\224\254\242\241\255")
		--SystemNotice(role ,"������� �� ������ ����� �� ����������")
		--SystemNotice(role ,"Potions effect for attribute bonus cannot be stacked")
		UseItemFailed ( role )
		return
	end

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end


	local statelv = 1
	local statetime = 3600
	AddState( role , role , STATE_YSTZQH , statelv , statetime )

end

--����� ���� (ID 0896)
function ItemUse_SPSlyj( role , Item )
	
	local OtherStateLv = 0
	local i = 0
	local State_Num = 3
	local State = {}
	State [0] = GetChaStateLv ( role , STATE_YSMJQH )
	State [1] = GetChaStateLv ( role , STATE_YSLQQH )
	State [2] = GetChaStateLv ( role , STATE_YSTZQH )
	State [3] = GetChaStateLv ( role , STATE_YSLLQH )

	for i = 0 , State_Num , 1 do
		if State[i] >= 1 then
			OtherStateLv = OtherStateLv + 1
		end
	end


	if OtherStateLv > 0 then
		SystemNotice(role ,"\221\244\244\229\234\242\251 \238\242 \228\240\243\227\232\245 \231\229\235\232\233 \237\229 \241\238\247\232\242\224\254\242\241\255")
		--SystemNotice(role ,"������� �� ������ ����� �� ����������")
		--SystemNotice(role ,"Potions effect for attribute bonus cannot be stacked")
		UseItemFailed ( role )
		return
	end

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end


	local statelv = 1
	local statetime = 3600
	AddState( role , role , STATE_YSJSQH , statelv , statetime )

end

--����� ���� (ID 0897)
function ItemUse_SPXsyj( role , Item )
	
	local OtherStateLv = 0
	local i = 0
	local State_Num = 3
	local State = {}
	State [0] = GetChaStateLv ( role , STATE_YSMJQH )
	State [1] = GetChaStateLv ( role , STATE_YSLQQH )
	State [2] = GetChaStateLv ( role , STATE_YSTZQH )
	State [3] = GetChaStateLv ( role , STATE_YSJSQH )

	for i = 0 , State_Num , 1 do
		if State[i] >= 1 then
			OtherStateLv = OtherStateLv + 1
		end
	end



	if OtherStateLv > 0 then
		SystemNotice(role ,"\221\244\244\229\234\242\251 \238\242 \228\240\243\227\232\245 \231\229\235\232\233 \237\229 \241\238\247\232\242\224\254\242\241\255")
		--SystemNotice(role ,"������� �� ������ ����� �� ����������")
		--SystemNotice(role ,"Potions effect for attribute bonus cannot be stacked")
		UseItemFailed ( role )
		return
	end	

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end


	local statelv = 1
	local statetime = 3600
	AddState( role , role , STATE_YSLLQH , statelv , statetime )

end

--------------------------------------------------------------------------------------------------
--���������\�������������� ������������
--------------------------------------------------------------------------------------------------

--��������� �������� (ID 3074)
function ItemUse_LSDZG ( role , Item )
	local statelv = 4
	local statetime = 60
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_JLGLJB , statelv , statetime )
	else
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

--�������������� ����������� (ID 3075)
function ItemUse_HSDZG ( role , Item )
	local statelv = 2
	local statetime = 60
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_HCGLJB , statelv , statetime )
	else
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

--------------------------------------------------------------------------------------------------
--���������� ��������\����� �������\���������
--------------------------------------------------------------------------------------------------

--���������� �������������� ����� (ID 3888)
function ItemUse_DSSDM ( role , Item )
	local statelv = 1
	local statetime = 300
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_PKSFYS , statelv , statetime )
	else
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

--������� ��� (ID 3896)
function ItemUse_XEZJ ( role , Item )
	local statelv = 1
	local statetime = 1800
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_PKZDYS , statelv , statetime )
	else
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

--������ ����� (ID 0851)
function ItemUse_XEZJB ( role , Item )
	Rem_State_StarUnnormal ( role )
	local statelv = 1
	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		Rem_State_StarUnnormal ( role )
		AddState( role , role , STATE_KUANGZ , statelv , statetime )
	else
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

--���������� ������� (ID3899)
function ItemUse_SDTG ( role , Item )
	
	local hp = GetChaAttr(role, ATTR_HP) 
	local sp = GetChaAttr(role, ATTR_SP) 
	
	hp_resume = 30 
	sp_resume = 10
	
	hp = hp + hp_resume 
	sp = sp + sp_resume 

	mxhp = GetChaAttr(role,ATTR_MXHP) 
	mxsp = GetChaAttr(role,ATTR_MXSP) 

	if hp > mxhp then 
		hp = mxhp 
	end 

	if sp > mxsp then 
		sp = mxsp 
	end 

	SetCharaAttr(hp, role, ATTR_HP)
	SetCharaAttr(sp, role, ATTR_SP) 

end

--�������������� ����� (ID 3895)
function ItemUse_SDWZBOX ( role , Item )
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local CheckDateNum = NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	
	if CheckDateNum < 122423  then
		SystemNotice ( role , "\207\238\230\224\235\243\233\241\242\224, \225\243\228\252\242\229 \242\229\240\239\229\235\232\226\251. \209\224\237\242\224 \202\235\224\243\241 \225\243\228\229\242 \238\247\229\237\252 \239\243\237\234\242\243\224\235\229\237 \241 \226\224\248\232\236 \239\238\228\224\240\234\238\236. \207\238\230\224\235\243\233\241\242\224, \232\241\239\238\235\252\231\243\233\242\229 \239\240\229\228\236\229\242 \236\229\230\228\243 24-\251\236 \228\229\234\224\225\240\255, 8.00 \243\242\240\224 \232 25-\251\236 \228\229\234\224\225\240\255, 8.00 \226\229\247\229\240\224" )
		--SystemNotice ( role , "����������, ������ ���������. ����� ����� ����� ����� ���������� � ����� ��������. ����������, ����������� ������� ����� 24-�� �������, 8.00 ���� � 25-�� �������, 8.00 ������" )
		--SystemNotice ( role , "Please be patient. Santa Claus will be very punctual with his gift. Please use the item between 24th December 8.00pm and 25th December 8.00am" )
		UseItemFailed ( role )
		return
	end
	
	if CheckDateNum > 122506 then
		SystemNotice ( role , "\209\224\237\242\224 \202\235\224\243\241 \243\229\245\224\235. \207\238\239\251\242\224\233\242\229\241\252 \232\241\239\238\235\252\231\238\226\224\242\252 \239\240\229\228\236\229\242 \226 \241\235\229\228\243\254\249\229\236 \227\238\228\243" )
		--SystemNotice ( role , "����� ����� �����. ����������� ������������ ������� � ��������� ����" )
		--SystemNotice ( role , "Santa Claus has left. Please wait for next year" )
		UseItemFailed ( role )
		return
	end
	
	local item_type = BaoXiang_SDWZBOX
	local item_type_rad = BaoXiang_SDWZBOX_Rad 
	local item_type_count = BaoXiang_SDWZBOX_Count 
	local maxitem = BaoXiang_SDWZBOX_Mxcount
	local item_quality = BaoXiang_SDWZBOX_Qua
	local General = 0  
	local ItemId = 0 
	
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k

		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
end

--���������� ��������� (ID 3898)
function ItemUse_SDLHBOX ( role , Item )
	local Check = math.random ( 1, 100 )
	if Check <= 35 then

		local exp = Exp ( role )
		local exp_dif = math.random ( 1000000000000 , 3000000000000 )
		if Lv ( TurnToCha ( role )  )  >= 80 then 
			exp_dif = math.floor ( exp_dif / 50  ) 
		end 
		local exp_new = exp + exp_dif
	
		SetCharaAttr ( exp_new , role , ATTR_CEXP )

	elseif Check > 35 and Check <= 70 then
		local Money_add = math.random ( 200 , 600 )
		AddMoney ( role , 0 , Money_add )
	else
		local item_type = BaoXiang_SDLHBOX
		local item_type_rad = BaoXiang_SDLHBOX_Rad 
		local item_type_count = BaoXiang_SDLHBOX_Count 
		local maxitem = BaoXiang_SDLHBOX_Mxcount
		local item_quality = BaoXiang_SDLHBOX_Qua
		local General = 0  
		local ItemId = 0 
		
		local Item_CanGet = GetChaFreeBagGridNum ( role )
		
		if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
			UseItemFailed ( role )
			return
		end
		for i = 1 , maxitem , 1 do 
			General = item_type_rad [ i ] + General		
		end 
		local a = math.random ( 1, General )
		local b = 0
		local d = 0 
		local c = -1
		for k = 1 , maxitem , 1 do

			d = item_type_rad [ k ] + b

			 if a <= d and a > b then
				c = k

			end 
			b = d 
		end 
		if c == -1 then 
			ItemId = 3124 
		else 
			ItemId = item_type [c]  
			ItemCount = item_type_count [c] 
		end 
		GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	end
end

--���������� ������� (ID 3901)
function ItemUse_HYBOX ( role , Item )

--	local Item_CanGet = GetChaFreeBagGridNum ( role )
--	if Item_CanGet <= 1 then
--		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
--		SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
--		SystemNotice(role ,"Insufficient slots in inventory to open Lucky Packet")
--		UseItemFailed ( role )
--		return
--	end
	
	local Money_Add = 8
	local exp_dif = 0
	local exp_random = math.random( 1 , 1000 )
	if exp_random == 1000 then
		Money_Add = 8888
		exp_dif = 66600
	else
		
		exp_dif = math.random ( 2 , 6 )
		exp_dif = exp_dif * 50
	end
	
	local exp = Exp ( role )
	if Lv ( TurnToCha ( role )  )  >= 80 then 
		exp_dif = math.floor ( exp_dif / 50  ) 
	end 
	local exp_new = exp + exp_dif
	
	AddMoney ( role , 0 , Money_Add )
	SetCharaAttr ( exp_new , role , ATTR_CEXP )
	
        local zmbox_random = math.random( 1 , 500 )
        if  zmbox_random == 500 then

	    local item_type = BaoXiang_HYBOX 
	    local item_type_rad = BaoXiang_HYBOX_Rad 
	    local item_type_count = BaoXiang_HYBOX_Count 
	    local maxitem = BaoXiang_HYBOX_Mxcount
	    local item_quality = BaoXiang_HYBOX_Qua
	    local General = 0  
	    local ItemId = 0 
	    for i = 1 , maxitem , 1 do 
	  	    General = item_type_rad [ i ] + General		
	    end 
	    local a = math.random ( 1, General )
	    local b = 0
	    local d = 0 
	    local c = -1
	    for k = 1 , maxitem , 1 do

		  d = item_type_rad [ k ] + b

		   if a <= d and a > b then
			  c = k
			  break 
		  end 
		  b = d 
	    end 
	    if c == -1 then 
		  ItemId = 3124 
	    else 
		  ItemId = item_type [c]  
	  	  ItemCount = item_type_count [c] 
	    end 
	  GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
       end
	  GiveItem ( role , 0 , 3904 , 1 , 5 ) 
--	local itemname = GetItemName ( ItemId ) 
--	local cha_name = GetChaDefaultName ( role ) 
--	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \209\247\224\241\242\235\232\226\251\233 \236\229\248\238\247\229\234 \232 \239\238\235\243\247\224\229\242 "..itemname  
--	local message = cha_name.." ��������� ���������� ������� � �������� "..itemname 
--	local message = cha_name.." opens a Lucky Packet and obtained "..itemname 
--	Notice ( message )
end 

--���������� ������� (ID 3902)
function ItemUse_FGBOX ( role , Item )
	
	AddMoney ( role , 0 , 88 )	
	local item_type = BaoXiang_FGBOX 
	local item_type_rad = BaoXiang_FGBOX_Rad 
	local item_type_count = BaoXiang_FGBOX_Count 
	local maxitem = BaoXiang_FGBOX_Mxcount	
	local item_quality = BaoXiang_FGBOX_Qua
	local General = 0  
	local ItemId = 0 
--	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
--	if Item_CanGet <= 1 then
--		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
--		SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
--		SystemNotice(role ,"Insufficient space in inventory. Unable to use Fortune Packet")
--		UseItemFailed ( role )
--		return
--	end

	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break
		end 
		b = d 

	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality )
	GiveItem ( role , 0 , 3904 , 1 , item_quality )

	
	if ItemId == 878 then
		local itemname = GetItemName ( ItemId ) 
		local cha_name = GetChaDefaultName ( role ) 
		local message = cha_name.." \238\242\234\240\251\226\224\229\242 \209\247\224\241\242\235\232\226\251\233 \236\229\248\238\247\229\234 \232 \239\238\235\243\247\224\229\242  "..itemname 
		--local message = cha_name.." ��������� ���������� ������� � ��������  "..itemname  
		--local message = cha_name.." opens a Fortune Packet and obtained  "..itemname  
		Notice ( message )
	end
end 

--������� ����� (ID 3903)
function ItemUse_HYUNBOX ( role , Item )
	
	AddMoney ( role , 0 , 888 )
	local item_type = BaoXiang_HYUNBOX 
	local item_type_rad = BaoXiang_HYUNBOX_Rad 
	local item_type_count = BaoXiang_HYUNBOX_Count 
	local maxitem = BaoXiang_HYUNBOX_Mxcount
	local item_quality = BaoXiang_HYUNBOX_Qua
	local General = 0  
	local ItemId = 0 
--	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
--	if Item_CanGet <= 1 then
--		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
--		SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
--		SystemNotice(role ,"Insufficient space in inventory. Unable to use Prosperous Packet")
--		UseItemFailed ( role )
--		return
--	end

	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break		
		end 
		b = d 

	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality )
	GiveItem ( role , 0 , 3904 , 1 , item_quality )

	local GoodItem = {}
	GoodItem[0] = 3844
	GoodItem[1] = 3845
	GoodItem[2] = 899
	GoodItem[3] = 900
	GoodItem[4] = 901
	GoodItem[5] = 902
	GoodItem[6] = 903

	local Good_C = 0
	for Good_C = 0 , 6 , 1 do
		if ItemId == GoodItem[Good_C] then
			local itemname = GetItemName ( ItemId ) 
			local cha_name = GetChaDefaultName ( role ) 
			local message = cha_name.." \238\242\234\240\251\226\224\229\242 a \193\238\235\252\248\238\233 \239\224\234\229\242 \232 \239\238\235\243\247\224\229\242 "..itemname
			--local message = cha_name.." ��������� a ������� ����� � �������� "..itemname 
			--local message = cha_name.." opens a Prosperous Packet and obtained "..itemname 
			Notice ( message )
		end
	end
end 

--������ ������ ������� (ID 3905)
function ItemUse_ADBOX ( role , Item )
	local item_type = BaoXiang_ADBOX 
	local item_type_rad = BaoXiang_ADBOX_Rad 
	local item_type_count = BaoXiang_ADBOX_Count 
	local maxitem = BaoXiang_ADBOX_Mxcount
	local item_quality = BaoXiang_ADBOX_Qua
	local General = 0  
	local ItemId = 0 
--	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
--	if Item_CanGet <= 0 then
--		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \210\229\236\237\251\233 \234\224\236\229\237\252 \230\229\235\224\237\232\233")
--		SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ������ ������ �������")
--		SystemNotice(role ,"Insufficient space in inventory. Unable to use Wishing Stone")
--		UseItemFailed ( role )
--		return
--	end

	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
--	local itemname = GetItemName ( ItemId ) 
--	local cha_name = GetChaDefaultName ( role ) 
--	local message = cha_name.."\240\224\231\240\243\225\224\229\242 \210\229\236\237\251\233 \234\224\236\229\237\252 \230\229\235\224\237\232\233 \232 \239\238\235\243\247\224\229\242"..itemname 
--	local message = cha_name.."��������� ������ ������ ������� � ��������"..itemname  
--	local message = cha_name.."rubbed a Wishing Stone and obtained"..itemname   
--	Notice ( message )
end 

--���������� ������ ������� (ID 3906)
function ItemUse_SGBOX ( role , Item )
	local item_type = BaoXiang_SGBOX 
	local item_type_rad = BaoXiang_SGBOX_Rad 
	local item_type_count = BaoXiang_SGBOX_Count 
	local maxitem = BaoXiang_SGBOX_Mxcount
	local item_quality = BaoXiang_SGBOX_Qua
	local General = 0  
	local ItemId = 0 
--	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
--	if Item_CanGet <= 0 then
--		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \200\241\234\240\255\249\232\233\241\255 \234\224\236\229\237\252 \230\229\235\224\237\232\233")
--		SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���������� ������ �������")
--		SystemNotice(role ,"������������ ����� � ���������. Unable to use Wishing Stone")
--		UseItemFailed ( role )
--		return
--	end

	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
	
	local GoodItem = {}
	
	GoodItem[0] = 879
	GoodItem[1] = 880
	GoodItem[2] = 881
	GoodItem[3] = 882
	GoodItem[4] = 883
	GoodItem[5] = 884
	GoodItem[6] = 885
	GoodItem[7] = 887
	GoodItem[8] = 7
	GoodItem[9] = 42
	GoodItem[10] = 18
	GoodItem[11] = 1375
	GoodItem[12] = 1384
	GoodItem[13] = 1394
	GoodItem[14] = 1411
	GoodItem[15] = 1421
	GoodItem[16] = 4198
	GoodItem[17] = 4200
	GoodItem[18] = 4202
	GoodItem[19] = 4204
	GoodItem[20] = 4206
	GoodItem[21] = 4208
	

	local Good_C = 0
	for Good_C = 0 , 21 , 1 do
		if ItemId == GoodItem[Good_C] then
			local itemname = GetItemName ( ItemId ) 
			local cha_name = GetChaDefaultName ( role ) 
			local message = cha_name.."\232\241\239\238\235\252\231\229\242 \200\241\234\240\255\249\232\233\241\255 \234\224\236\229\237\252 \230\229\235\224\237\232\233 \232 \239\238\235\243\247\224\229\242 "..itemname
			--local message = cha_name.."��������� ���������� ������ ������� � �������� "..itemname  
			--local message = cha_name.."uses a Sparking Wishing Stone and obtained "..itemname  
			Notice ( message )
		end
	end
end 

--��������� ��� (ID 0262)
function ItemUse_JingLingBOX ( role, Item )
	local item_type = BaoXiang_JingLingBOX 
	local item_type_rad = BaoXiang_JingLingBOX_Rad 
	local item_type_count = BaoXiang_JingLingBOX_Count 
	local maxitem = BaoXiang_JingLingBOX_Mxcount
	local item_quality = BaoXiang_JingLingBOX_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \202\238\240\238\225\238\247\234\243 \212\229\233")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ��������� ���")
		--SystemNotice(role ,"Insufficient inventory space. Unable to use Fairy Box")
		UseItemFailed ( role )
		return
	end

	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end   
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b   
		 if a <= d and a > b then
			c = k
			break
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
end

--����� (ID 3909)
function ItemUse_SSSJ ( role , Item )

  	local hp = GetChaAttr(role, ATTR_HP) 
	local mxhp = GetChaAttr(role,ATTR_MXHP) 	
	hp = hp + 0.2*mxhp 

	if hp > mxhp then 
		hp = mxhp 
	end 
	SetCharaAttr(hp, role, ATTR_HP)

end

--������������ �� ������� (ID 3910)
function ItemUse_CJTHL ( role , Item )
      
	GiveItem ( role , 0 , 3911 , 1 , 5 ) 	
  	local hp = GetChaAttr(role, ATTR_HP) 
	local sp = GetChaAttr(role, ATTR_SP) 
	
	hp_resume = 10000 
	sp_resume = 10000
	
	hp = hp + hp_resume 
	sp = sp + sp_resume 

	mxhp = GetChaAttr(role,ATTR_MXHP) 
	mxsp = GetChaAttr(role,ATTR_MXSP) 

	if hp > mxhp then 
		hp = mxhp 
	end 

	if sp > mxsp then 
		sp = mxsp 
	end 

	SetCharaAttr(hp, role, ATTR_HP)
	SetCharaAttr(sp, role, ATTR_SP)    


end

--������ ������ (ID 0852)
function ItemUse_Denglong ( role , Item )
	local statelv = 1
	local statetime = 800
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_DENGLONG , statelv , statetime )
	else
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

--------------------------------------------------------------------------------------------------
--����\������� ��� ����������
--------------------------------------------------------------------------------------------------
	
--���� (ID 3343)
function ItemUse_MeiGui ( role , Item )
	local statelv = 1
	local statetime = 600
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_MEIGUI , statelv , statetime )
	else
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

--������� ��� ���������� (ID 3344)
function ItemUse_BZ ( role , Item )
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local CheckDateNum = NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	local Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )

	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role ) 
		return 
	end 
end 

--------------------------------------------------------------------------------------------------
--�������
--------------------------------------------------------------------------------------------------

--������ ����� (OD 0192)
function ItemUse_SaintCloth ( role , Item ) 
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet <= 3 then
		SystemNotice(role ,"\205\229\238\225\245\238\228\232\236\238 4 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224 \226 \232\237\226\229\237\242\224\240\229, \247\242\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234 \202\232\235\232\237")
		--SystemNotice(role ,"���������� 4 ��������� ����� � ���������, ��� ������� ������ �����")
		--SystemNotice(role ,"Requires 4 slots in inventory to open Chest of Kylin")
		UseItemFailed ( role )
		return
	end
	if cha_type == 4 then 
		GiveItem ( cha , 0 , 828 , 1 , 0 )	
	end 
	GiveItem ( cha , 0 , 825 , 1 , 0 )	
	GiveItem ( cha , 0 , 826 , 1 , 0 )	
	GiveItem ( cha , 0 , 827 , 1 , 0 )	
end 


--	���� � �������� ��������� (����) (ID 0209)
function ItemUse_SCBoxYXTZ ( role , Item )		--ҹ����װ
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet <= 2 then
		SystemNotice(role ,"\215\242\238\225\251 \238\242\234\240\251\242\252 \241\243\237\228\243\234 \237\243\230\237\238 3 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224 \226 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"����� ������� ������ ����� 3 ��������� ����� � ���������")
		--SystemNotice(role ,"To open the chest requires 3 empty slots")
		UseItemFailed ( role )
		return
	end

	if cha_type == 1 then
		GiveItem ( cha , 0 , 0395 , 1 , 95 )	
		GiveItem ( cha , 0 , 0587 , 1 , 95 )	
		GiveItem ( cha , 0 , 0747 , 1 , 95 )	
	else
		SystemNotice(role ,"\208\224\231\236\229\240 \242\229\235\224 \237\229 \241\238\238\242\226\229\242\241\242\226\243\229\242. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������ ���� �� �������������. ���������� ������� ������")
		--SystemNotice(role ,"Body size does not match. Unable to open chest")
		UseItemFailed ( role )
		return
	end
end

--���� � �������� ��������� (��������) (ID 0210)
function ItemUse_SCBoxLSTZ ( role , Item )		
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet <= 3 then
		SystemNotice(role ,"\215\242\238\225\251 \238\242\234\240\251\242\252 \241\243\237\228\243\234 \237\243\230\237\238 3 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224 \226 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"����� ������� ������ ����� 3 ��������� ����� � ���������")
		--SystemNotice(role ,"To open the chest requires 3 empty slots")
		UseItemFailed ( role )
		return
	end
	if cha_type == 2 then
		GiveItem ( cha , 0 , 0397 , 1 , 95 )
		GiveItem ( cha , 0 , 0829 , 1 , 95 )
		GiveItem ( cha , 0 , 0603 , 1 , 95 )
	else
		SystemNotice(role ,"\208\224\231\236\229\240 \242\229\235\224 \237\229 \241\238\238\242\226\229\242\241\242\226\243\229\242. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������ ���� �� �������������. ���������� ������� ������")
		--SystemNotice(role ,"Body size does not match. Unable to open chest")
		UseItemFailed ( role )
		return
	end

end

--���� � �������� ��������� (�������) (ID 0211)
function ItemUse_SCBoxHYTZ ( role , Item )
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet <= 2 then
		SystemNotice(role ,"\215\242\238\225\251 \238\242\234\240\251\242\252 \241\243\237\228\243\234 \237\243\230\237\238 3 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224 \226 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"����� ������� ������ ����� 3 ��������� ����� � ���������")
		--SystemNotice(role ,"To open the chest requires 3 empty slots")
		UseItemFailed ( role )
		return
	end

	if cha_type == 1 or cha_type == 3 then
		GiveItem ( cha , 0 , 0399 , 1 , 95 )
		GiveItem ( cha , 0 , 0589 , 1 , 95 )
		GiveItem ( cha , 0 , 0749 , 1 , 95 )
	else
		SystemNotice(role ,"\208\224\231\236\229\240 \242\229\235\224 \237\229 \241\238\238\242\226\229\242\241\242\226\243\229\242. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������ ���� �� �������������. ���������� ������� ������")
		--SystemNotice(role ,"Body size does not match. Unable to open chest")
		UseItemFailed ( role )
		return
	end

end

--���������� ������������� ���� (������/�����) (ID 0212)
function ItemUse_SCBoxFYSTZ ( role , Item )
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet <= 3 then
		SystemNotice(role ,"\215\242\238\225\251 \238\242\234\240\251\242\252 \241\243\237\228\243\234 \237\243\230\237\238 4 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224 \226 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"����� ������� ������ ����� 4 ��������� ����� � ���������")
		--SystemNotice(role ,"Lack of 4 inventory slots. Unable to open chest.")
		UseItemFailed ( role )
		return
	end
	
	if cha_type == 3 then
		GiveItem ( cha , 0 , 0401 , 1 , 95 )
		GiveItem ( cha , 0 , 0591 , 1 , 95 )
		GiveItem ( cha , 0 , 0751 , 1 , 95 )
	elseif cha_type == 4 then
		GiveItem ( cha , 0 , 0403 , 1 , 95 )
		GiveItem ( cha , 0 , 0593 , 1 , 95 )
		GiveItem ( cha , 0 , 0753 , 1 , 95 )
		GiveItem ( cha , 0 , 2218 , 1 , 95 )
	else
		SystemNotice(role ,"\208\224\231\236\229\240 \242\229\235\224 \237\229 \241\238\238\242\226\229\242\241\242\226\243\229\242. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������ ���� �� �������������. ���������� ������� ������")
		--SystemNotice(role ,"Body size does not match. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
end

--���� � �������� ��������� (���/������� �����) (ID 0213)
function ItemUse_SCBoxSZZTZ ( role , Item )
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet <= 3 then
		SystemNotice(role ,"\215\242\238\225\251 \238\242\234\240\251\242\252 \241\243\237\228\243\234 \237\243\230\237\238 4 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224 \226 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"����� ������� ������ ����� 4 ��������� ����� � ���������")
		--SystemNotice(role ,"Lack of 4 inventory slots. Unable to open chest.")
		UseItemFailed ( role )
		return
	end
	
	if cha_type == 3 then
		GiveItem ( cha , 0 , 0405 , 1 , 95 )
		GiveItem ( cha , 0 , 0595 , 1 , 95 )
		GiveItem ( cha , 0 , 0755 , 1 , 95 )
	elseif cha_type == 4 then
		GiveItem ( cha , 0 , 0407 , 1 , 95 )
		GiveItem ( cha , 0 , 0597 , 1 , 95 )
		GiveItem ( cha , 0 , 0757 , 1 , 95 )
		GiveItem ( cha , 0 , 2220 , 1 , 95 )
	else
		SystemNotice(role ,"\208\224\231\236\229\240 \242\229\235\224 \237\229 \241\238\238\242\226\229\242\241\242\226\243\229\242. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������ ���� �� �������������. ���������� ������� ������")
		--SystemNotice(role ,"Body size does not match. Unable to open chest")
		UseItemFailed ( role )
		return
	end
end

--���� � �������� ��������� (������/������) (ID 0214)
function ItemUse_SCBoxHHSTZ ( role , Item )	
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet <= 3 then
		SystemNotice(role ,"\215\242\238\225\251 \238\242\234\240\251\242\252 \241\243\237\228\243\234 \237\243\230\237\238 4 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224 \226 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"����� ������� ������ ����� 4 ��������� ����� � ���������")
		--SystemNotice(role ,"Lack of 4 inventory slots. Unable to open chest.")
		UseItemFailed ( role )
		return
	end
	
	if cha_type == 1 or cha_type == 3 then
		GiveItem ( cha , 0 , 0409 , 1 , 95 )
		GiveItem ( cha , 0 , 0599 , 1 , 95 )
		GiveItem ( cha , 0 , 0759 , 1 , 95 )
	elseif cha_type == 4 then
		GiveItem ( cha , 0 , 0412 , 1 , 95 )
		GiveItem ( cha , 0 , 0601 , 1 , 95 )
		GiveItem ( cha , 0 , 0761 , 1 , 95 )
		GiveItem ( cha , 0 , 2222 , 1 , 95 )
	else
		SystemNotice(role ,"\208\224\231\236\229\240 \242\229\235\224 \237\229 \241\238\238\242\226\229\242\241\242\226\243\229\242. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������ ���� �� �������������. ���������� ������� ������")
		--SystemNotice(role ,"Body size does not match. Unable to open chest")
		UseItemFailed ( role )
		return
	end
end

--���� � ������� ������� (������) (ID 0215)
function ItemUse_SCBoxRYBZ ( role , Item )
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet == 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end

	GiveItem ( cha , 0 , 0109 , 1 , 95 )
end

--���� � ������� ������� (��� �������) (ID 0216)
function ItemUse_SCBoxXMC ( role , Item )
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet == 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end

	GiveItem ( cha , 0 , 0111 , 1 , 95 )
end

--���� � ������� ������� (�����) (ID 0217)
function ItemUse_SCBoxLQJ ( role , Item )
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet == 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end

	GiveItem ( cha , 0 , 0113 , 1 , 95 )
end

--���� � ������� ������� (���) (ID 0218)
function ItemUse_SCBoxLYJ ( role , Item )
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet == 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end

	GiveItem ( cha , 0 , 0115 , 1 , 95 )
end

--���� � ������� ������� (������) (ID 0219)
function ItemUse_SCBoxFHG ( role , Item )
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet == 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end

	GiveItem ( cha , 0 , 0117 , 1 , 95 )
end

--���� � ������� ������� (������) (ID 0220)
function ItemUse_SCBoxLXHZ ( role , Item )
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet == 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end

	GiveItem ( cha , 0 , 0119 , 1 , 95 )
end

--���������� ��������� ���� (�����������) (ID 0221)
function ItemUse_SCBoxYCJ ( role , Item )
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet == 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end

	GiveItem ( cha , 0 , 0150 , 1 , 95 )
end

--------------------------------------------------------------------------------------------------
--������ ���������\����� ���������, ����� ��������
--------------------------------------------------------------------------------------------------

--������ ��������� (ID 1092)
function ItemUse_Map_YPJ ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		SystemNotice(role ,"\211 \194\224\241 \228\238\235\230\229\237 \225\251\242\252 \239\238 \234\240\224\233\237\229\233 \236\229\240\229 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"� ��� ������ ���� �� ������� ���� 1 ��������� ���� � ���������")
		--SystemNotice(role ,"You need to have at least 1 empty inventory slot")
		UseItemFailed ( role )
		return
	end 
	local Has_GoldenMap = CheckBagItem ( role , 1093 )
	if Has_GoldenMap >= 1 then
		SystemNotice ( role , "\194\251 \236\238\230\229\242\229 \239\240\232\237\229\241\242\232 \242\238\235\252\234\238 1 \209\242\224\240\243\254 \234\224\240\242\243 \239\232\240\224\242\241\234\232\245 \241\238\234\240\238\226\232\249 \231\224 \238\228\232\237 \240\224\231" )
		--SystemNotice ( role , "�� ������ �������� ������ 1 ������ ����� ��������� �������� �� ���� ���" )
		--SystemNotice ( role , "You can only bring 1 Treasure Map at a time" )
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1093 , 1 , 0 )
end

--����� ��������� (ID 0684)
function ItemUse_Map_JLBYPJ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		SystemNotice(role ,"\211 \194\224\241 \228\238\235\230\229\237 \225\251\242\252 \239\238 \234\240\224\233\237\229\233 \236\229\240\229 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"� ��� ������ ���� �� ������� ���� 1 ��������� ���� � ���������")
		UseItemFailed ( role )
		return
	end 
	local Has_GoldenMap = CheckBagItem ( role , 682 )
	local lv= GetChaAttr(role, ATTR_LV) 
	if Has_GoldenMap >= 1 then
		SystemNotice ( role , "\194\251 \236\238\230\229\242\229 \239\240\232\237\229\241\242\232 \242\238\235\252\234\238 1 \202\224\240\242\243 \202\224\240\232\225\241\234\232\245 \241\238\234\240\238\226\232\249 \231\224 \238\228\232\237 \240\224\231" )
		--SystemNotice ( role , "�� ������ �������� ������ 1 ����� ��������� �������� �� ���� ���" )
		UseItemFailed ( role )
		return
	end
	if lv <1 or  lv >9000 then
		SystemNotice ( role , "\210\238\235\252\234\238 \239\229\240\241\238\237\224\230\232 \236\229\230\228\243 15 \232 40 \243\240\238\226\237\255\236\232 \236\238\227\243\242 \232\241\239\238\235\252\231\238\226\224\242\252 \205\238\226\251\233 \207\229\240\227\224\236\229\237\242" )
		--SystemNotice ( role , "������ ��������� ����� 15 � 40 �������� ����� ������������ ����� ���������" )
		UseItemFailed ( role )
		return	
	end
	GiveItem ( role , 0 , 682 , 1 , 0 )
end

--������ ����� ��������� �������� ID 1093)
function ItemUse_GoldenMap ( role , Item )
 	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		SystemNotice(role ,"\211 \194\224\241 \228\238\235\230\229\237 \225\251\242\252 \239\238 \234\240\224\233\237\229\233 \236\229\240\229 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"� ��� ������ ���� �� ������� ���� 1 ��������� ���� � ���������")
		--SystemNotice(role ,"You need to have at least 1 empty inventory slot")
		UseItemFailed ( role )
		return
	end 
	local Has_GoldenMap = CheckBagItem ( role , 1093 )
	if Has_GoldenMap >= 2 then
		SystemNotice ( role , "\211 \226\224\241 \225\238\235\252\248\229 \247\229\236 \238\228\237\224 \209\242\224\240\224\255 \234\224\240\242\224 \239\232\240\224\242\241\234\232\245 \241\238\234\240\238\226\232\249. \207\238\232\241\234\232 \241\238\234\240\238\226\232\249\224 \237\229 \243\226\229\237\247\224\235\232\241\252 \243\241\239\229\245\238\236" )
		--SystemNotice ( role , "� ��� ������ ��� ���� ������ ����� ��������� ��������. ������ ��������� �� ���������� �������" )
		--SystemNotice ( role , "Brought more than 1 Treasure Map. Digging failed" )
		UseItemFailed ( role )
		return
	end
	local Item = GetChaItem2 ( role , 2 , 1093 )
	local Item_MAXURE = GetItemAttr ( Item , ITEMATTR_MAXURE )
	local Item_URE = GetItemAttr ( Item , ITEMATTR_URE )
	local Item_MAXENERGY = GetItemAttr ( Item , ITEMATTR_MAXENERGY )
	local pos_x = Item_MAXURE
	local pos_y = Item_MAXENERGY
	local Themap = Item_URE
--	SystemNotice ( role , "pos_x"..pos_x )
--	SystemNotice ( role , "pos_y"..pos_y )
--	SystemNotice ( role , "Themap"..Themap )
	
	local MapList = { }
	
	MapList [0] = "NoMap"
	MapList [1] = "magicsea"

	local MapNameList = { }
	
	MapNameList [0] = "No map"
	MapNameList [1] = "\216\224\233\242\224\237\229"
	
	if pos_x == 0 or pos_y == 0 or Themap == 0 then
		pos_x , pos_y , Themap = GetTheMapPos ( role , 1 )		
--		pos_x,pos_y,Themap = GetMapRanPos ( role )
		Item_MAXURE = pos_x
		Item_URE = Themap
		Item_MAXENERGY = pos_y
		
		SetItemAttr ( Item , ITEMATTR_MAXENERGY , Item_MAXENERGY )
		SetItemAttr ( Item , ITEMATTR_MAXURE , Item_MAXURE )
		SetItemAttr ( Item , ITEMATTR_URE , Item_URE )
--		SystemNotice ( role , "Themap"..Themap )
--		Item_MAXENERGY = GetItemAttr ( Item , ITEMATTR_MAXENERGY )
--		SystemNotice ( role , "Item_MAXENERGY"..Item_MAXENERGY )
	end
	local GetPos = CheckGetMapPos ( role , pos_x , pos_y , MapList[Themap] )
--	SystemNotice ( role , "CheckPosOver"..GetPos ) 
	if GetPos == 0 then
		SystemNotice ( role , "\209\238\234\240\238\226\232\249\229 \241\239\240\255\242\224\237\238 \226 "..MapNameList[Themap].." \239\238 \234\238\238\240\228\232\237\224\242\224\236 ("..pos_x..","..pos_y..")" )
		--SystemNotice ( role , "��������� �������� � "..MapNameList[Themap].." �� ����������� ("..pos_x..","..pos_y..")" )
		--SystemNotice ( role , "Treasure is hidden in "..MapNameList[Themap].." Region near ("..pos_x..","..pos_y..")" )
		
		UseItemFailed ( role )
		return
	elseif GetPos == 1 then
		local getrandom = math.random ( 1 , 3 )
		if getrandom == 1 then
			GiveGoldenMapItem ( role )
		else
			SystemNotice ( role , "\207\238\245\238\230\229, \247\242\238 \194\251 \237\232\247\229\227\238 \237\229 \237\224\248\235\232. \207\238\239\240\238\225\243\233\242\229 \239\238\232\241\234\224\242\252 \240\255\228\238\236" )
			--SystemNotice ( role , "������, ��� �� ������ �� �����. ���������� �������� �����" )
			--SystemNotice ( role , "Looks like nothing is dug out. Look again nearby" )
			UseItemFailed ( role )
			return
		end
	end
end

--����� ��������� �������� (ID 0682)
function ItemUse_JLB_GoldenMap ( role , Item )
 	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"\211 \194\224\241 \228\238\235\230\229\237 \225\251\242\252 \239\238 \234\240\224\233\237\229\233 \236\229\240\229 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"� ��� ������ ���� �� ������� ���� 1 ��������� ���� � ���������")
		--SystemNotice(role ,"You need to have at least 1 empty inventory slot")
		UseItemFailed ( role )
		return
	end 
	local lv= GetChaAttr(role, ATTR_LV) 
	if lv <1 or  lv >9000 then
		SystemNotice ( role , "\207\229\240\241\238\237\224\230\232 \236\229\237\252\248\229, \247\229\236 \243\240\238\226\237\255 15 \232\235\232 \226\251\248\229 \247\229\236 \243\240\238\226\237\255 40 \237\229 \236\238\227\243\242 \232\241\239\238\235\252\231\238\226\224\242\252 \253\242\243 \234\224\240\242\243 \241\238\234\240\238\226\232\249" )
		--SystemNotice ( role , "���������  ������, ��� ������ 15 ��� ���� ��� ������ 40 �� ����� ������������ ��� ����� ��������" )
		--SystemNotice ( role , "Characters lower than Lv 15 or higher than Lv 40 cannot use this treasure map" )
		UseItemFailed ( role )
		return	
	end
	local Has_GoldenMap = CheckBagItem ( role , 682 )
	if Has_GoldenMap >= 2 then
		SystemNotice ( role , "\211 \194\224\241 \236\238\230\229\242 \242\238\235\252\234\238 \225\251\242\252 1 \234\224\240\242\224 \241\238\234\240\238\226\232\249 \226 \232\237\226\229\237\242\224\240\229, \247\242\238\225\251 \232\241\234\224\242\252 \241\238\234\240\238\226\232\249\229. \207\238\230\224\235\243\233\241\242\224 \243\228\224\235\232\242\229 \232\235\232 \239\238\235\238\230\232\242\229 \226 \225\224\237\234 \238\241\242\224\235\252\237\251\229" )
		--SystemNotice ( role , "� ��� ����� ������ ���� 1 ����� �������� � ���������, ����� ������ ���������. ���������� ������� ��� �������� � ���� ���������" )
		--SystemNotice ( role , "You can only have 1 treasure map in inventory to seek for treasure. Please deposit the rest into your vault" )
		UseItemFailed ( role )
		return
	end
	local Item = GetChaItem2 ( role , 2 , 682 )
	local Item_MAXURE = GetItemAttr ( Item , ITEMATTR_MAXURE )
	local Item_URE = GetItemAttr ( Item , ITEMATTR_URE )
	local Item_MAXENERGY = GetItemAttr ( Item , ITEMATTR_MAXENERGY )
	local pos_x = Item_MAXURE
	local pos_y = Item_MAXENERGY
	local Themap = Item_URE
	local MapList = { }	
	MapList [0] = "NoMap"
	MapList [1] = "jialebi"
	local MapNameList = { }
	MapNameList [0] = "No map"
	MapNameList [1] = "\206\241\242\240\238\226\229 \209\238\234\240\238\226\232\249"
	if pos_x == 0 or pos_y == 0 or Themap == 0 then
		pos_x , pos_y , Themap = GetTheMapPos_JLB ( role , 1 )	
		Item_MAXURE = pos_x
		Item_URE = Themap
		Item_MAXENERGY = pos_y
		SetItemAttr ( Item , ITEMATTR_MAXENERGY , Item_MAXENERGY )
		SetItemAttr ( Item , ITEMATTR_MAXURE , Item_MAXURE )
		SetItemAttr ( Item , ITEMATTR_URE , Item_URE )
	end
	local GetPos = CheckGetMapPos ( role , pos_x , pos_y , MapList[Themap] )
	if GetPos == 0 then
		SystemNotice ( role , "\209\238\234\240\238\226\232\249\229 \241\239\240\255\242\224\237\238 \237\224 "..MapNameList[Themap].." \239\238 \234\238\238\240\228\232\237\224\242\224\236 ["..pos_x..","..pos_y.."]" )
		--SystemNotice ( role , "��������� �������� � "..MapNameList[Themap].." �� ����������� ("..pos_x..","..pos_y..")" )
		UseItemFailed ( role )
		return
	elseif GetPos == 1 then
		local getrandom = math.random ( 1 , 3 )
		if getrandom == 1 then
			GiveGoldenMapItem_JLB ( role )
		else
			SystemNotice ( role , "\207\238\245\238\230\229, \247\242\238 \226\251 \237\232\247\229\227\238 \237\229 \237\224\248\235\232. \207\238\239\240\238\225\243\233\242\229 \239\238\232\241\234\224\242\252 \240\255\228\238\236 " )
			--SystemNotice ( role , "������, ��� �� ������ �� �����. ���������� �������� �����" )
			UseItemFailed ( role )
			return
		end
	end
end

--------------------------------------------------------------------------------------------------
--������
--------------------------------------------------------------------------------------------------

--���������� ������ (ID 3240)
function ItemUse_BirthCake ( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		local attr_ap = Attr_ap( role )
		local ap_extre = 3
		attr_ap = attr_ap + ap_extre 
		SetCharaAttr( attr_ap, role, ATTR_AP )
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

--������ "���������� �����" (ID 0853)
function ItemUse_HappyBook ( role , Item )
	local Cha_Boat = 0
	local charLv=Lv ( role )
	local dif_exp_one = DEXP[charLv+1]
	local dif_exp_three = DEXP[charLv+3]
	local dif_exp_five = DEXP[charLv+5]
	local Exp_star=GetChaAttr (  role , ATTR_CEXP )
	local dif_exp_half = (DEXP[charLv+1] - DEXP[charLv])*0.5 +  Exp_star +10
	local dif_exp_thalf = (DEXP[charLv+1] - DEXP[charLv])*0.3  +  Exp_star + 10
	local dif_exp_thalf_b = dif_exp_thalf - DEXP[charLv+1]
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	elseif charLv>=1 and charLv<=9 then
		SetChaAttrI( role , ATTR_CEXP , dif_exp_five )
	elseif charLv>=10 and charLv<=29 then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_three )
	elseif charLv>=30 and charLv<=59 then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_one )
	elseif charLv>=60 and charLv<=75 then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_half )
	elseif charLv>=76 and charLv<=85 and charLv~=79  then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf )
	elseif charLv==79 and dif_exp_thalf_b<=0 then 
			SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf )
	elseif charLv==79 and dif_exp_thalf_b>0 then 
			dif_exp_thalf = dif_exp_thalf_b*0.02 + DEXP[charLv+1]
			SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf )
	elseif charLv>=86 then
		SystemNotice( role , "\194\224\248 \243\240\238\226\229\237\252 \241\235\232\248\234\238\236 \226\251\241\238\234\232\233, \247\242\238\225\251 \232\241\239\238\235\252\231\238\226\224\242\252 \253\242\238\242 \239\240\229\228\236\229\242" )
		--SystemNotice( role , "��� ������� ������� �������, ����� ������������ ���� �������" )
		--SystemNotice( role , "Your level is too high to use" )
		UseItemFailed ( role )
		return
	end
end

--�������� ��� (ID 3335)
function ItemUse_MarchElf ( role , Item )
	local statelv = 1
	local statetime = 600
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		local cha_type = GetChaTypeID ( role )
		if cha_type == 3 or cha_type == 4 then
			AddState( role , role , STATE_MarchElf , statelv , statetime )
		else
			SystemNotice ( role , "\208\224\231\226\232\242\232\229 \244\229\232 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238 \242\238\235\252\234\238 \230\229\237\241\234\232\236 \239\238\235\238\236" )
			--SystemNotice ( role , "�������� ��� ����� ���� ������������ ������ ������� �����" )
			--SystemNotice ( role , "Fairy March can only be used by female" )
			UseItemFailed ( role )
			return
		end
	else
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end

end

--����� ��������� (ID 3339)
function ItemUse_MspdYS ( role , Item )
	local statelv = 1
	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )


	if Cha_Boat ==  nil then
		AddState( role , role , STATE_YSMspd , statelv , statetime )
		SystemNotice( role , "A" )

	else
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		return
	end

end

--����������� ����� (ID 3340)
function ItemUse_SanJiaoFan ( role , Item )
	local statelv = 1
	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~=  nil then
		AddState( Cha_Boat , Cha_Boat , STATE_YSBoatMspd , statelv , statetime )
	else
		SystemNotice( role , "\204\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238 \242\238\235\252\234\238 \226 \236\238\240\229" )
		--SystemNotice( role , "����� ���� ������������ ������ � ����" )
		--SystemNotice( role , "Only can be used while sailing" )
		UseItemFailed ( role )
		return
	end

end

--������������������ ������ (ID 3341)
function ItemUse_GJZhuangJia ( role , Item )
	local statelv = 1
	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~=  nil then
		AddState( Cha_Boat , Cha_Boat , STATE_YSBoatDEF , statelv , statetime )
	else
		SystemNotice( role , "\204\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238 \242\238\235\252\234\238 \226 \236\238\240\229" )
		--SystemNotice( role , "����� ���� ������������ ������ � ����" )
		--SystemNotice( role , "Only can be used while sailing" )
		UseItemFailed ( role )
		return
	end

end

--------------------------------------------------------------------------------------------------
--������
--------------------------------------------------------------------------------------------------

--������ ������� (ID 3087)
function ItemUse_SuanmingMoney ( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		SuanmingTeshu_Money ( role )
	end
end
	

--���������� ������ (ID 3086)
function ItemUse_SuanmingWork ( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		local lv = Lv ( role )
		local exp = Exp(role) 
		local clexp = GetChaAttrI ( role , ATTR_CLEXP )
		if exp < clexp then
			SystemNotice ( role , "\206\239\251\242 \237\232\230\229 \247\229\236 \243\240\238\226\229\237\252. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \230\240\229\225\232\233" )
			--SystemNotice ( role , "���� ���� ��� �������. ���������� ������������ ������" )
			--SystemNotice ( role , "Experience lower than level. Unable to use lot." )
			UseItemFailed ( role )
			return
		end
		
		local Has_GoldenMap = CheckBagItem ( role , 3336 )
		if Has_GoldenMap >= 1 then
			SystemNotice ( role , "\200\241\239\238\235\252\231\243\229\242\241\255 \204\232\241\242\232\247\229\241\234\232\233 \202\235\229\226\229\240" )
			--SystemNotice ( role , "������������ ����������� ������" )
			--SystemNotice ( role , "Used Mystic Clover" 
			SuanmingTeshu_Work ( role )
			DelBagItem( role , 3336 , 1 )	
		else
			Suanming_Work ( role )
		end
	else
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

--------------------------------------------------------------------------------------------------
--����������� ��������� ��������	
--------------------------------------------------------------------------------------------------

--���� (ID 4259)
function ItemUse_HuoRongSW ( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		RemoveState( role , STATE_BDJ )
		AddState ( role , role , STATE_TTISW , 1 , 300 )
	else
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" 
		UseItemFailed ( role )
		return
	end
	
end

--��������� ����� (ID 4260)
function ItemUse_ZhouGUSW ( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		RemoveState( role , STATE_ZZZH )
		AddState ( role , role , STATE_TTISW , 2 , 300 )
	else
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing"
		UseItemFailed ( role )
		return
	end
	
end

--���� (ID 4261)
function ItemUse_ShuiMangSW ( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		RemoveState( role , STATE_CRXSF )
		AddState ( role , role , STATE_TTISW , 3 , 300 )
	else
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing"
		UseItemFailed ( role )
		return
	end
	
end

--������ (ID 4249)
function ItemUse_HuFuSW ( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		RemoveState( role , STATE_JSDD )
		AddState ( role , role , STATE_TTISW , 4 , 1200 )
	else
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing"
		UseItemFailed ( role )
		return
	end
	
end

--------------------------------------------------------------------------------------------------
--�������, ����������� ���������	
--------------------------------------------------------------------------------------------------

--������ � 28 �������� (ID3088)
function ItemUse_28BeiBao( role , Item ) 
	local bagnum = GetKbCap(role) 
	if bagnum >= 28 then
		SystemNotice(role ,"\205\229\235\252\231\255 \232\241\239\238\235\252\231\238\226\224\242\252 \237\229\241\234\238\235\252\234\238 \240\224\231")
		--SystemNotice(role ,"������ ������������ ��������� ���")
		--SystemNotice(role ,"Cannot use item repeatedly")
		UseItemFailed ( role )
		return
	end
	AddKbCap(role, 4) 
end 

--������ � 32 �������� ID 3089)
function ItemUse_32BeiBao( role , Item ) 
	local bagnum = GetKbCap(role) 
	if bagnum >= 32 then
		SystemNotice(role ,"\205\229\235\252\231\255 \232\241\239\238\235\252\231\238\226\224\242\252 \237\229\241\234\238\235\252\234\238 \240\224\231")
		--SystemNotice(role ,"������ ������������ ��������� ���")
		--SystemNotice(role ,"Cannot use item repeatedly")
		UseItemFailed ( role )
		return
	end
	if bagnum <= 24 then
		SystemNotice(role ,"\207\238\230\224\235\243\233\241\242\224, \240\224\241\248\232\240\252\242\229 \241\237\224\247\224\235\238 \232\237\226\229\237\242\224\240\252 \237\224 28 \255\247\229\229\234")
		--SystemNotice(role ,"����������, ��������� ������� ��������� �� 28 �����")
		--SystemNotice(role ,"Cannot use item above your level")
		UseItemFailed ( role )
		return
	end
	AddKbCap(role, 4) 
end 

--������ � 36 �������� (ID 3090)
function ItemUse_36BeiBao( role , Item ) 
	local bagnum = GetKbCap(role) 
	if bagnum >= 36 then
		SystemNotice(role ,"\205\229\235\252\231\255 \232\241\239\238\235\252\231\238\226\224\242\252 \237\229\241\234\238\235\252\234\238 \240\224\231")
		--SystemNotice(role ,"������ ������������ ��������� ���")
		--SystemNotice(role ,"Cannot use item repeatedly")
		UseItemFailed ( role )
		return
	end
	if bagnum <= 28 then
		SystemNotice(role ,"\207\238\230\224\235\243\233\241\242\224, \240\224\241\248\232\240\252\242\229 \241\237\224\247\224\235\238 \232\237\226\229\237\242\224\240\252 \237\224 32 \255\247\229\233\234\232")
		--SystemNotice(role ,"����������, ��������� ������� ��������� �� 32 ������")
		--SystemNotice(role ,"Cannot use item above your level")
		UseItemFailed ( role )
		return
	end
	AddKbCap(role, 4) 
end 

--������ � 40 �������� (ID 3091)
function ItemUse_40BeiBao( role , Item ) 
	local bagnum = GetKbCap(role) 
	if bagnum >= 40 then
		SystemNotice(role ,"\205\229\235\252\231\255 \232\241\239\238\235\252\231\238\226\224\242\252 \237\229\241\234\238\235\252\234\238 \240\224\231")
		--SystemNotice(role ,"������ ������������ ��������� ���")
		--SystemNotice(role ,"Cannot use item repeatedly")
		UseItemFailed ( role )
		return
	end
	if bagnum <= 32 then
		SystemNotice(role ,"\207\238\230\224\235\243\233\241\242\224, \240\224\241\248\232\240\252\242\229 \241\237\224\247\224\235\238 \232\237\226\229\237\242\224\240\252 \237\224 36 \255\247\229\229\234")
		--SystemNotice(role ,"����������, ��������� ������� ��������� �� 36 �����")
		--SystemNotice(role ,"Cannot use item above your level")
		UseItemFailed ( role )
		return
	end
	AddKbCap(role, 4) 
end 

--������ � 44 �������� (ID 3092)
function ItemUse_44BeiBao( role , Item ) 
	local bagnum = GetKbCap(role) 
	if bagnum >= 44 then
		SystemNotice(role ,"\205\229\235\252\231\255 \232\241\239\238\235\252\231\238\226\224\242\252 \237\229\241\234\238\235\252\234\238 \240\224\231")
		--SystemNotice(role ,"������ ������������ ��������� ���")
		--SystemNotice(role ,"Cannot use item repeatedly")
		UseItemFailed ( role )
		return
	end
	if bagnum <= 36 then
		SystemNotice(role ,"\207\238\230\224\235\243\233\241\242\224, \240\224\241\248\232\240\252\242\229 \241\237\224\247\224\235\238 \232\237\226\229\237\242\224\240\252 \237\224 40 \255\247\229\229\234")
		--SystemNotice(role ,"����������, ��������� ������� ��������� �� 40 �����")
		--SystemNotice(role ,"Cannot use item above your level")
		UseItemFailed ( role )
		return
	end
	AddKbCap(role, 4) 
end 

--������ � 48 �������� (ID 3093)
function ItemUse_48BeiBao( role , Item ) 
	local bagnum = GetKbCap(role) 
	if bagnum >= 48 then
		SystemNotice(role ,"\205\229\235\252\231\255 \232\241\239\238\235\252\231\238\226\224\242\252 \237\229\241\234\238\235\252\234\238 \240\224\231")
		--SystemNotice(role ,"������ ������������ ��������� ���")
		--SystemNotice(role ,"Cannot use item repeatedly")
		UseItemFailed ( role )
		return
	end
	if bagnum <= 40 then
		SystemNotice(role ,"\207\238\230\224\235\243\233\241\242\224, \240\224\241\248\232\240\252\242\229 \241\237\224\247\224\235\238 \232\237\226\229\237\242\224\240\252 \237\224 44 \255\247\229\233\234\232")
		--SystemNotice(role ,"����������, ��������� ������� ��������� �� 44 ������")
		--SystemNotice(role ,"Cannot use item above your level")
		UseItemFailed ( role )
		return
	end
	AddKbCap(role, 4) 
end 

--��������� (ID 3126)
function ItemUse_BQ ( role , Item )

end 

--------------------------------------------------------------------------------------------------
--�������, ������ ��� ���, ����� ������ ������� ��� ���
--------------------------------------------------------------------------------------------------

--������� ��� (ID 0227)
function ItemUse_SiLiao ( role , Item , Item_Traget )
	
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing"
		UseItemFailed ( role ) 
		return 
	end      
		local Item_Traget_URE=GetItemAttr(Item_Traget,ITEMATTR_URE)
		local Item_Traget_MAXURE=GetItemAttr(Item_Traget,ITEMATTR_MAXURE)
		local Item_type = GetItemType ( Item )
		local Item_Traget_Type = GetItemType ( Item_Traget )
		local Num = 5000

		if Item_type == 57 and Item_Traget_Type == 59 then
				if Item_Traget_URE < Item_Traget_MAXURE then
				   Give_ElfURE ( role , Item_Traget , Num )
   	 			else
                    SystemNotice(role , "\212\229\255 \241\251\242\224" ) 
					--SystemNotice(role , "��� ����" ) 
					--SystemNotice(role , "Fairy is full" ) 
					UseItemFailed ( role )
					return
				end
		end 

end

--���� ��� (ID 3152)
function ItemUse_CWSiLiao ( role , Item , Item_Traget )
	
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing"
		UseItemFailed ( role ) 
		return 
	end      
		local Item_Traget_URE=GetItemAttr(Item_Traget,ITEMATTR_URE)
		local Item_Traget_MAXURE=GetItemAttr(Item_Traget,ITEMATTR_MAXURE)
		local Item_type = GetItemType ( Item )
		local Item_Traget_Type = GetItemType ( Item_Traget )
		local Num = 250

		if Item_type == 57 and Item_Traget_Type == 59 then
				if Item_Traget_URE < Item_Traget_MAXURE then
				   Give_ElfURE ( role , Item_Traget , Num )
   	 			else
                    SystemNotice(role , "\212\229\255 \241\251\242\224" ) 
					--SystemNotice(role , "��� ����" ) 
					--SystemNotice(role , "Fairy is full" 
					UseItemFailed ( role )
					return
				end
		end 

end

--����� �������� ������� (ID - 0222)
function ItemUse_LS_longguo ( role , Item , Item_Traget ) 

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing"
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type = GetItemType ( Item )
		local Item_Traget_Type = GetItemType ( Item_Traget )
		local Item_Num = GetItemID ( Item )
		local Check_Exp = 0
		local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 
		--SystemNotice(role ,Elf_MaxEXP )

		if Item_type == 58 and Item_Traget_Type == 59 then
				Check_Exp = CheckElf_EXP ( role , Item_Traget ) 
				if Check_Exp == 0 then
					SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224. \205\229\226\238\231\236\238\230\237\238 \239\238\234\238\240\236\232\242\252 \244\229\254 \244\240\243\234\242\238\236 \209\237\229\230\237\238\227\238 \196\240\224\234\238\237\224" ) 
					--SystemNotice(role , "���� ��� �� ������ ���������. ���������� ��������� ��� ������� �������� �������" ) 
					--SystemNotice(role , "Growth rate is not full. Unable to feed pet with Snow Dragon Fruit" ) 
					UseItemFailed ( role )
				else
				   Lvup_Str ( role , Item_Num , Item_Traget )
				end 
		end 
end

--������� ����� (ID 0223)
function ItemUse_LS_koumei ( role , Item , Item_Traget ) 

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type = GetItemType ( Item )
		local Item_Traget_Type = GetItemType ( Item_Traget )
		local Item_Num = GetItemID ( Item )
		local Check_Exp = 0
		local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 

		if Item_type == 58 and Item_Traget_Type == 59 then
				Check_Exp = CheckElf_EXP ( role , Item_Traget )
				if Check_Exp == 0 then
					SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224. \205\229\226\238\231\236\238\230\237\238 \239\238\234\238\240\236\232\242\252 \244\229\254 \203\229\228\255\237\238\233 \241\235\232\226\238\233" ) 
					--SystemNotice(role , "���� ��� �� ������ ���������. ���������� ��������� ��� ������� ������" ) 
					--SystemNotice(role , "Growth rate is not full. Unable to feed pet with Icespire Plum" ) 
					UseItemFailed ( role )
				else
				   Lvup_Agi ( role , Item_Num , Item_Traget )
				end 
		end 
end

--������� � ������ (ID 0224)
function ItemUse_LS_yusi ( role , Item , Item_Traget ) 

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type = GetItemType ( Item )
		local Item_Traget_Type = GetItemType ( Item_Traget )
		local Item_Num = GetItemID ( Item )
		local Check_Exp = 0
		local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 

		if Item_type == 58 and Item_Traget_Type == 59  then
				Check_Exp = CheckElf_EXP ( role , Item_Traget )
				if Check_Exp == 0 then
					SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224. \205\229\226\238\231\236\238\230\237\238 \239\238\234\238\240\236\232\242\252 \244\229\254 \212\232\248\244\235\238\241\238\236 \241 \199\229\244\232\240\224" ) 
					--SystemNotice(role , "���� ��� �� ������ ���������. ���������� ��������� ��� ��������� � ������" ) 
					--SystemNotice(role , "Growth rate is not full. Unable to feed pet with Zephyr Fish Floss" ) 
					UseItemFailed ( role )
				else
				   Lvup_Dex ( role , Item_Num , Item_Traget )
				end 
		end 
end

--���������� ����� (ID 0225)
function ItemUse_LS_guopu ( role , Item , Item_Traget ) 

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type = GetItemType ( Item )
		local Item_Traget_Type = GetItemType ( Item_Traget )
		local Item_Num = GetItemID ( Item )
		local Check_Exp = 0
		local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 

		if Item_type == 58 and Item_Traget_Type == 59 then
				Check_Exp = CheckElf_EXP ( role , Item_Traget )
				if Check_Exp == 0 then
					SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224. \205\229\226\238\231\236\238\230\237\238 \239\238\234\238\240\236\232\242\252 \244\229\254 \209\229\240\229\225\240\255\237\251\236 \236\224\237\227\238" ) 
					--SystemNotice(role , "���� ��� �� ������ ���������. ���������� ��������� ��� ���������� �����" )
					--SystemNotice(role , "Growth rate is not full. Unable to feed pet with Argent Mango" )
					UseItemFailed ( role )
				else
				   Lvup_Con ( role , Item_Num , Item_Traget )
				end 
		end 
end

--���������� ������� (ID 0226)
function ItemUse_LS_mibing ( role , Item , Item_Traget ) 

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type = GetItemType ( Item )
		local Item_Traget_Type = GetItemType ( Item_Traget )
		local Item_Num = GetItemID ( Item )
		local Check_Exp = 0
		local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 

		if Item_type == 58 and Item_Traget_Type == 59  then
				Check_Exp = CheckElf_EXP ( role , Item_Traget ) 
				if Check_Exp == 0 then
					SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224. \205\229\226\238\231\236\238\230\237\238 \239\238\234\238\240\236\232\242\252 \244\229\254 \216\224\233\242\224\237\241\234\232\236 \225\232\241\234\226\232\242\238\236" )
					--SystemNotice(role , "���� ��� �� ������ ���������. ���������� ��������� ��� ���������� ���������" ) 
					--SystemNotice(role , "Growth rate is not full. Unable to feed pet with Shaitan Biscuit" ) 
					UseItemFailed ( role )
				else
				   Lvup_Sta ( role , Item_Num , Item_Traget ) 
				end  
			        --local Item_MAXENERGY = Elf_MaxEXP + 20
				--SetItemAttr ( Item_Traget , ITEMATTR_MAXENERGY , Item_MAXENERGY )				
		end 
end


--������ ���. �� (ID 0243)
function ItemUse_HuDun_CJ ( role , Item , Item_Traget )
			--SystemNotice( role , "s" )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )
		local SkillType = 1	
		local SkillNum = 1		
				--SystemNotice( role , SkillType )
				--SystemNotice( role , SkillNum )

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )

			if Check == 1 then
				SystemNotice(role , "\194\251 \243\230\229 \232\231\243\247\224\235\232 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "�� ��� ������� ������ ������" ) 
				--SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
		        --SystemNotice( role , "AddElfSkill" )

			AddElfSkill ( Item_Traget , SkillType , SkillNum )
				--SystemNotice( role , "\211\236\229\237\232\229 \225\251\235\238 \226\251\243\247\229\237\238" )
				----SystemNotice( role , "������ ���� �������" )
		        ----SystemNotice( role , "skill has been added" )

			end
		end

end

--������� ������ (ID 0244)
function ItemUse_HuDun_ZJ ( role , Item , Item_Traget ) 
			--SystemNotice( role , "s" )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )
		local SkillType = 2		
		local SkillNum = 1	
				--SystemNotice( role , SkillType )
				--SystemNotice( role , SkillNum )

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )

			if Check == 1 then
				SystemNotice(role , "\194\251 \243\230\229 \232\231\243\247\224\235\232 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "�� ��� ������� ������ ������" ) 
				--SystemNotice(role , "have target skill, usage failed" 
				UseItemFailed ( role )
			else
		        --SystemNotice( role , "AddElfSkill" )

			AddElfSkill ( Item_Traget , SkillType , SkillNum )
				--SystemNotice( role , "\211\236\229\237\232\229 \225\251\235\238 \226\251\243\247\229\237\238" )
				----SystemNotice( role , "������ ���� �������" )
		        ----SystemNotice( role , "skill has been added" )

			end
		end

end

--������ ���. ��. (ID 0245)
function ItemUse_HuDun_GJ ( role , Item , Item_Traget )
			--SystemNotice( role , "s" )

--	local Cha_Boat = 0
--	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
--	if Cha_Boat ~= nil then 
--		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" 
		UseItemFailed ( role ) 
--		return 
--	end 
--		local Item_type =  GetItemType ( Item )
--		local Item_Traget_Type =  GetItemType ( Item_Traget )
--		local Num = GetItemForgeParam ( Item_Traget , 1 )
--		local SkillType = 3		--Ҫ���ӵ� Skill ����
--		local SkillNum = 1		--Ҫ���ӵ�Skill ���
				--SystemNotice( role , SkillType )
				--SystemNotice( role , SkillNum )
--
--		if Item_type == 58 and Item_Traget_Type == 59 then
--			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )

--			if Check == 1 then
				--SystemNotice(role , "\194\251 \243\230\229 \232\231\243\247\224\235\232 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "�� ��� ������� ������ ������" ) 
				--SystemNotice(role , "have target skill, usage failed"  
--				UseItemFailed ( role )
--			else
		        --SystemNotice( role , "AddElfSkill" )

--			AddElfSkill ( Item_Traget , SkillType , SkillNum )
				--SystemNotice( role , "\211\236\229\237\232\229 \225\251\235\238 \226\251\243\247\229\237\238" )
				----SystemNotice( role , "������ ���� �������" )
		        ----SystemNotice( role , "skill has been added" )
--			end
--		end

end


--������� ���. ��. (ID 0246)
function ItemUse_BaoJi_CJ ( role , Item , Item_Traget )
			--SystemNotice( role , "s" )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )
		local SkillType = 1	
		local SkillNum = 2	
				--SystemNotice( role , SkillType )
				--SystemNotice( role , SkillNum )

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )

			if Check == 1 then
				SystemNotice(role , "\194\251 \243\230\229 \232\231\243\247\224\235\232 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "�� ��� ������� ������ ������" ) 
				--SystemNotice(role , "have target skill, usage failed" 
				UseItemFailed ( role )
			else
		        --SystemNotice( role , "AddElfSkill" )

			AddElfSkill ( Item_Traget , SkillType , SkillNum )
				--SystemNotice( role , "\211\236\229\237\232\229 \225\251\235\238 \226\251\243\247\229\237\238" )
				----SystemNotice( role , "������ ���� �������" )
		        ----SystemNotice( role , "skill has been added" )

			end
		end

end

--������� �������(ID 0247
function ItemUse_BaoJi_ZJ ( role , Item , Item_Traget )  
			--SystemNotice( role , "s" )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	
		local SkillType = 2	
		local SkillNum = 2		
				--SystemNotice( role , SkillType )
				--SystemNotice( role , SkillNum )

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )

			if Check == 1 then
				SystemNotice(role , "\194\251 \243\230\229 \232\231\243\247\224\235\232 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "�� ��� ������� ������ ������" ) 
				--SystemNotice(role , "have target skill, usage failed" 
				UseItemFailed ( role )
			else
		        --SystemNotice( role , "AddElfSkill" )

			AddElfSkill ( Item_Traget , SkillType , SkillNum )
				--SystemNotice( role , "\211\236\229\237\232\229 \225\251\235\238 \226\251\243\247\229\237\238" )
				----SystemNotice( role , "������ ���� �������" )
		        ----SystemNotice( role , "skill has been added" )

			end
		end

end

--������� ���. ��. (ID 0248)
function ItemUse_BaoJi_GJ ( role , Item , Item_Traget ) 
			--SystemNotice( role , "s" )

--	local Cha_Boat = 0
--	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
--	if Cha_Boat ~= nil then 
--		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" ) 
		
		UseItemFailed ( role ) 
--		return 
--	end 
--		local Item_type =  GetItemType ( Item )
--		local Item_Traget_Type =  GetItemType ( Item_Traget )
--		local Num = GetItemForgeParam ( Item_Traget , 1 )	
--		local SkillType = 3		
--		local SkillNum = 2		
				--SystemNotice( role , SkillType )
				--SystemNotice( role , SkillNum )

--		if Item_type == 58 and Item_Traget_Type == 59 then
--			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
--
--			if Check == 1 then
--				SystemNotice(role , "\194\251 \243\230\229 \232\231\243\247\224\235\232 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "�� ��� ������� ������ ������" ) 
				--SystemNotice(role , "have target skill, usage failed" 
--				UseItemFailed ( role )
--			else
--		       -- SystemNotice( role , "AddElfSkill" )
--
--			AddElfSkill ( Item_Traget , SkillType , SkillNum )
				--SystemNotice( role , "\211\236\229\237\232\229 \225\251\235\238 \226\251\243\247\229\237\238" )
				----SystemNotice( role , "������ ���� �������" )
		        ----SystemNotice( role , "skill has been added" )
--
--			end
--		end
--
end

--����� ���. ��. (ID 0249)
function ItemUse_MoLi_CJ ( role , Item , Item_Traget )   --����ħ��
			--SystemNotice( role , "s" )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )
		local SkillType = 1		
		local SkillNum = 3	
				--SystemNotice( role , SkillType )
				--SystemNotice( role , SkillNum )

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )

			if Check == 1 then
				SystemNotice(role , "\194\251 \243\230\229 \232\231\243\247\224\235\232 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "�� ��� ������� ������ ������" ) 
				--SystemNotice(role , "have target skill, usage failed"  
				UseItemFailed ( role )
			else
		        --SystemNotice( role , "AddElfSkill" )

			AddElfSkill ( Item_Traget , SkillType , SkillNum )
				--SystemNotice( role , "\211\236\229\237\232\229 \225\251\235\238 \226\251\243\247\229\237\238" )
				----SystemNotice( role , "������ ���� �������" )
		        ----SystemNotice( role , "skill has been added" )

			end
		end

end


--������� ����� (ID 0250)
function ItemUse_MoLi_ZJ ( role , Item , Item_Traget )   --�м�ħ��
			--SystemNotice( role , "s" )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	
		local SkillType = 2		
		local SkillNum = 3		
				--SystemNotice( role , SkillType )
				--SystemNotice( role , SkillNum )

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )

			if Check == 1 then
				SystemNotice(role , "\194\251 \243\230\229 \232\231\243\247\224\235\232 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "�� ��� ������� ������ ������" ) 
				--SystemNotice(role , "have target skill, usage failed" 
				UseItemFailed ( role )
			else
		        --SystemNotice( role , "AddElfSkill" )

			AddElfSkill ( Item_Traget , SkillType , SkillNum )
				--SystemNotice( role , "\211\236\229\237\232\229 \225\251\235\238 \226\251\243\247\229\237\238" )
				----SystemNotice( role , "������ ���� �������" )
		        ----SystemNotice( role , "skill has been added" )

			end
		end

end

--����� ���. ��. (ID 0251)
function ItemUse_MoLi_GJ ( role , Item , Item_Traget ) 
			--SystemNotice( role , "s" )

--	local Cha_Boat = 0
--	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
--	if Cha_Boat ~= nil then 
--		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing"  
		UseItemFailed ( role ) 
--		return 
--	end 
--		local Item_type =  GetItemType ( Item )
--		local Item_Traget_Type =  GetItemType ( Item_Traget )
--		local Num = GetItemForgeParam ( Item_Traget , 1 )
--		local SkillType = 3	
--		local SkillNum = 3	
--				--SystemNotice( role , SkillType )
--				--SystemNotice( role , SkillNum )
--
--		if Item_type == 58 and Item_Traget_Type == 59 then
--			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
--
--			if Check == 1 then
--				SystemNotice(role , "\194\251 \243\230\229 \232\231\243\247\224\235\232 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "�� ��� ������� ������ ������" ) 
				--SystemNotice(role , "have target skill, usage failed" 
--				UseItemFailed ( role )
--			else
--		        --SystemNotice( role , "AddElfSkill" )
--
--			AddElfSkill ( Item_Traget , SkillType , SkillNum )
				--SystemNotice( role , "\211\236\229\237\232\229 \225\251\235\238 \226\251\243\247\229\237\238" )
				----SystemNotice( role , "������ ���� �������" )
		        ----SystemNotice( role , "skill has been added" )
--
--			end
--		end

end

--�������������� ���. ��.(ID 0252)
function ItemUse_HuiFu_CJ ( role , Item , Item_Traget )  
			--SystemNotice( role , "s" )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )
		local SkillType = 1	
		local SkillNum = 4	
				--SystemNotice( role , SkillType )
				--SystemNotice( role , SkillNum )

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )

			if Check == 1 then
				SystemNotice(role , "\194\251 \243\230\229 \232\231\243\247\224\235\232 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "�� ��� ������� ������ ������" ) 
				--SystemNotice(role , "have target skill, usage failed" 
				UseItemFailed ( role )
			else
		        --SystemNotice( role , "AddElfSkill" )

			AddElfSkill ( Item_Traget , SkillType , SkillNum )
				--SystemNotice( role , "\211\236\229\237\232\229 \225\251\235\238 \226\251\243\247\229\237\238" )
				----SystemNotice( role , "������ ���� �������" )
		        ----SystemNotice( role , "skill has been added" )

			end
		end

end

--������� �������������� (ID 0253)
function ItemUse_HuiFu_ZJ ( role , Item , Item_Traget )   
			--SystemNotice( role , "s" )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	
		local SkillType = 2		
		local SkillNum = 4	
				--SystemNotice( role , SkillType )
				--SystemNotice( role , SkillNum )

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )

			if Check == 1 then
				SystemNotice(role , "\194\251 \243\230\229 \232\231\243\247\224\235\232 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "�� ��� ������� ������ ������" ) 
				--SystemNotice(role , "have target skill, usage failed" 
				UseItemFailed ( role )
			else
		        --SystemNotice( role , "AddElfSkill" )

			AddElfSkill ( Item_Traget , SkillType , SkillNum )
				--SystemNotice( role , "\211\236\229\237\232\229 \225\251\235\238 \226\251\243\247\229\237\238" )
				----SystemNotice( role , "������ ���� �������" )
		        ----SystemNotice( role , "skill has been added" )


			end
		end

end


--�������������� ���. ��.(ID 0254)
function ItemUse_HuiFu_GJ ( role , Item , Item_Traget )  
			--SystemNotice( role , "s" )

--	local Cha_Boat = 0
--	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
--	if Cha_Boat ~= nil then 
--		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" 
		UseItemFailed ( role ) 
--		return 
--	end 
--		local Item_type =  GetItemType ( Item )
--		local Item_Traget_Type =  GetItemType ( Item_Traget )
--		local Num = GetItemForgeParam ( Item_Traget , 1 )	 
--		local SkillType = 3		
--		local SkillNum = 4		
--				--SystemNotice( role , SkillType )
--				--SystemNotice( role , SkillNum )
--
--		if Item_type == 58 and Item_Traget_Type == 59 then
--			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
--
--			if Check == 1 then
--				SystemNotice(role , "\194\251 \243\230\229 \232\231\243\247\224\235\232 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "�� ��� ������� ������ ������" ) 
				--SystemNotice(role , "have target skill, usage failed" 
--				UseItemFailed ( role )
--			else
--		        --SystemNotice( role , "AddElfSkill" )
--
--			AddElfSkill ( Item_Traget , SkillType , SkillNum )
				--SystemNotice( role , "\211\236\229\237\232\229 \225\251\235\238 \226\251\243\247\229\237\238" )
				----SystemNotice( role , "������ ���� �������" )
		        ----SystemNotice( role , "skill has been added" )


--			end
--		end

end

--��������� ���. ��. (ID 0259)
function ItemUse_ChenSi_CJ ( role , Item , Item_Traget )   
			--SystemNotice( role , "s" )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing"
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	
		local SkillType = 1		
		local SkillNum = 5		
				--SystemNotice( role , SkillType )
				--SystemNotice( role , SkillNum )

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )

			if Check == 1 then
				SystemNotice(role , "\194\251 \243\230\229 \232\231\243\247\224\235\232 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "�� ��� ������� ������ ������" ) 
				--SystemNotice(role , "have target skill, usage failed" 
				UseItemFailed ( role )
			else
		        --SystemNotice( role , "AddElfSkill" )

			AddElfSkill ( Item_Traget , SkillType , SkillNum )
				--SystemNotice( role , "\211\236\229\237\232\229 \225\251\235\238 \226\251\243\247\229\237\238" )
				----SystemNotice( role , "������ ���� �������" )
		        ----SystemNotice( role , "skill has been added" )

			end
		end

end

--������� ��������� (ID 0260)
function ItemUse_ChenSi_ZJ ( role , Item , Item_Traget )   
			--SystemNotice( role , "s" )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )
		local SkillType = 2
		local SkillNum = 5	
				--SystemNotice( role , SkillType )
				--SystemNotice( role , SkillNum )

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )

			if Check == 1 then
				SystemNotice(role , "\194\251 \243\230\229 \232\231\243\247\224\235\232 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "�� ��� ������� ������ ������" ) 
				--SystemNotice(role , "have target skill, usage failed" 
				UseItemFailed ( role )
			else
		        --SystemNotice( role , "AddElfSkill" )

			AddElfSkill ( Item_Traget , SkillType , SkillNum )
				--SystemNotice( role , "\211\236\229\237\232\229 \225\251\235\238 \226\251\243\247\229\237\238" )
				----SystemNotice( role , "������ ���� �������" )
		        ----SystemNotice( role , "skill has been added" )

			end
		end

end


--��������� ���. ��. (ID 0261)
function ItemUse_ChenSi_GJ ( role , Item , Item_Traget )  
			--SystemNotice( role , "s" )

--	local Cha_Boat = 0
--	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
--	if Cha_Boat ~= nil then 
--		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing"  
		UseItemFailed ( role ) 
--		return 
--	end 
--		local Item_type =  GetItemType ( Item )
--		local Item_Traget_Type =  GetItemType ( Item_Traget )
--		local Num = GetItemForgeParam ( Item_Traget , 1 )
--		local SkillType = 3	
--		local SkillNum = 5	
--				--SystemNotice( role , SkillType )
--				--SystemNotice( role , SkillNum )
--
--		if Item_type == 58 and Item_Traget_Type == 59 then
--			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
--
--			if Check == 1 then
--					SystemNotice(role , "\194\251 \243\230\229 \232\231\243\247\224\235\232 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "�� ��� ������� ������ ������" ) 
				--SystemNotice(role , "have target skill, usage failed"
--				UseItemFailed ( role )
--			else
--		        --SystemNotice( role , "AddElfSkill" )
--
--			AddElfSkill ( Item_Traget , SkillType , SkillNum )
				--SystemNotice( role , "\211\236\229\237\232\229 \225\251\235\238 \226\251\243\247\229\237\238" )
				----SystemNotice( role , "������ ���� �������" )
		        ----SystemNotice( role , "skill has been added" ))
--
--			end
--		end

end





--������ ������� ������� (ID 0319)
function ItemUse_MonsterSummon ( role , Item , Item_Traget )

	local Monster_GetID = {}
	Monster_GetID[1] = math.random ( 40 , 80 )
	Monster_GetID[2] = math.random ( 98 , 146 )
	Monster_GetID[3] = math.random ( 194, 241 )
	Monster_GetID[4] = math.random ( 500, 571 )
	Monster_GetID[5]= 789

	local ID_Get = math.random ( 1 , 5 )
	local x, y = GetChaPos( role )
	local MonsterID = Monster_GetID [ ID_Get ]
	local Refresh = 50		
	local life = 40000		
	local new = CreateCha( MonsterID , x , y , 145 , Refresh )
	SetChaLifeTime( new, life )

end


--�������� ������ ID 0892)
function ItemUse_Ant_Hzcr ( role , Item , Item_Traget )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		RemoveState( Cha_Boat , STATE_HZCR )
	else
		SystemNotice( role , "\205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \237\224 \241\243\248\229" )
		--SystemNotice( role , "���������� ������������ �� ����" )
		--SystemNotice( role , "Unable to use on the shore" )
		UseItemFailed ( role )
		return
	end

end

--------------------------------------------------------------------------------------------------
--���� ���
--------------------------------------------------------------------------------------------------

--���� ����� (ID 0422)
function ItemUse_MINGZJLD ( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \255\233\246\238 \244\229\232")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���� ���")
		--SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end

	GiveItem ( role , 0 , 183  , 1 , 4 ) 
end

--���� ���� (ID 0423)
function ItemUse_FAZJLD ( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \255\233\246\238 \244\229\232")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���� ���")
		--SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end

	GiveItem ( role , 0 , 184  , 1 , 4 ) 
end

--���� ����������� (ID 0424)
function ItemUse_QIANZJLD ( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \255\233\246\238 \244\229\232")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���� ���")
		--SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end

	GiveItem ( role , 0 , 185  , 1 , 4 ) 
end

--���� ����� (ID 0425)
function ItemUse_HENGZJLD( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \255\233\246\238 \244\229\232")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���� ���")
		--SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end

	GiveItem ( role , 0 , 186  , 1 , 4 )  
end

--���� ���� (ID 0426)
function ItemUse_YUZJLD( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \255\233\246\238 \244\229\232")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���� ���")
		--SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end

	GiveItem ( role , 0 , 187  , 1 , 4 )  
end

--���� ������ (ID 0427)
function ItemUse_XUEZJLD( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \255\233\246\238 \244\229\232")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���� ���")
		--SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end

	GiveItem ( role , 0 , 188  , 1 , 4 )  
end

--���� ������� (ID 0428)
function ItemUse_XINGZJLD ( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \255\233\246\238 \244\229\232")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���� ���")
		--SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end

	GiveItem ( role , 0 , 189  , 1 , 4 )  
end

--���� ���� (ID 0429)
function ItemUse_HUIZJLD( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \255\233\246\238 \244\229\232")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���� ���")
		--SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end

	GiveItem ( role , 0 , 190  , 1 , 4 )  

end

--���� ����� (ID 0430)
function ItemUse_AIZJLD ( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \255\233\246\238 \244\229\232")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���� ���")
		--SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end

	GiveItem ( role , 0 , 191  , 1 , 4 )  
end

--���� ������ (ID 0431)
function ItemUse_XINGZHIJLD ( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \255\233\246\238 \244\229\232")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���� ���")
		--SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end

	GiveItem ( role , 0 , 199  , 1 , 4 )  
end

--------------------------------------------------------------------------------------------------
--������� �������� (1 - 45 �������)
--------------------------------------------------------------------------------------------------

--������ ������� (ID 0436)
function ItemUse_XRBOX( role, Item )
--	SystemNotice(role ,"Function has not been released")
--	UseItemFailed ( role )
--	return
	local lv = GetChaAttr(role, ATTR_LV)
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 3 then
		SystemNotice(role ,"��� �������� ���������� 2 ��������� ����� ")
		UseItemFailed ( role )
		return
	end
	if lv < 5 then
		SystemNotice(role ,"��� �������� ��������� 5 ������� ")
		UseItemFailed ( role )	
	else
		GiveItem ( role , 0 , 437  , 1 , 4 )
		GiveItem ( role , 0 , 1128  , 1 , 4 )
	end
end
----------------------------------Newbie Chest Lv.10
function ItemUse_XRBOX1( role, Item )
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
        local cha_type = GetChaTypeID ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 9 then
		SystemNotice(role ,"��� �������� ���������� 8 ��������� ������ ")
		UseItemFailed ( role )
		return
	end
	if lv < 10 then
		SystemNotice(role ,"��������� 10 ������� ")
		UseItemFailed ( role )	
	elseif job == 1 then  
		GiveItem ( role , 0 , 438  , 1 , 4 ) 
		GiveItem ( role , 0 , 1388  , 2 , 95 ) 
		GiveItem ( role , 0 , 290  , 1 , 95 )
		GiveItem ( role , 0 , 4603  , 20 , 4 )
		GiveItem ( role , 0 , 1128  , 1 , 4 )
		GiveItem ( role , 0 , 466  , 1 , 4 )
		GiveItem ( role , 0 , 642  , 1 , 4 ) 
	elseif job == 2 then   
		GiveItem ( role , 0 , 438  , 1 , 4 ) 
		GiveItem ( role , 0 , 25  , 1 , 95 ) 
		GiveItem ( role , 0 , 305  , 1 , 95 )
		GiveItem ( role , 0 , 4603  , 20 , 4 )
		GiveItem ( role , 0 , 481  , 1 , 4 )
		GiveItem ( role , 0 , 657  , 1 , 4 )
		GiveItem ( role , 0 , 1128  , 1 , 4 ) 
	elseif job == 4 then  
		GiveItem ( role , 0 , 4603  , 20 , 4 )
		GiveItem ( role , 0 , 1128  , 1 , 4 ) 
		GiveItem ( role , 0 , 438  , 1 , 4 ) 
		GiveItem ( role , 0 , 73  , 1 , 95 ) 
		if cha_type == 1 or cha_type == 3 then 
			GiveItem ( role , 0 , 335  , 1 , 95 ) 
			GiveItem ( role , 0 , 511  , 1 , 4 )
			GiveItem ( role , 0 , 687  , 1 , 95 )
		else 
			GiveItem ( role , 0 , 380  , 1 , 95 ) 
			GiveItem ( role , 0 , 556  , 1 , 95 ) 
			GiveItem ( role , 0 , 732  , 1 , 95 ) 
			GiveItem ( role , 0 , 2202  , 1 , 95 ) 
		end
	elseif job == 5 then   
		GiveItem ( role , 0 , 4603  , 20 , 4 ) 
		GiveItem ( role , 0 , 97  , 1 , 4 ) 
		GiveItem ( role , 0 , 1128  , 1 , 4 ) 
		GiveItem ( role , 0 , 438  , 1 , 4 ) 
		if cha_type == 3 then
			GiveItem ( role , 0 , 372  , 1 , 95 )
			GiveItem ( role , 0 , 541  , 1 , 95 ) 
			GiveItem ( role , 0 , 517  , 1 , 95 ) 
			GiveItem ( role , 0 , 365  , 1 , 4 ) 
		else 
			GiveItem ( role , 0 , 383  , 1 , 95 ) 
			GiveItem ( role , 0 , 559  , 1 , 95 ) 
			GiveItem ( role , 0 , 735  , 1 , 95 ) 
			GiveItem ( role , 0 , 2205  , 1 , 95 ) 
		end
	else 
		SystemNotice(role ,"�� ��� �� �������� ������ ��������� ")
		UseItemFailed ( role )	
	end
end
----------------------------------+2���˱���
function ItemUse_XRBOX2( role, Item )
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
        local cha_type = GetChaTypeID ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 6 then
		PopupNotice(role ,"��� �������� ���������� 6 ��������� ������. ")
		UseItemFailed ( role )
		return
	end
	if lv < 15 then
		PopupNotice(role ,"����� ������� ������, �� ������ ����� 15+ �������. ")
		UseItemFailed ( role )	
	elseif job == 1 then  
		GiveItem ( role , 0 , 10  , 2 , 95 )
		GiveItem ( role , 0 , 13  , 1 , 4 )		
		GiveItem ( role , 0 , 296  , 1 , 95 )
		GiveItem ( role , 0 , 472  , 1 , 4 )
		GiveItem ( role , 0 , 648  , 1 , 4 )
		GiveItem ( role , 0 , 439  , 1 , 4 ) 
	elseif job == 2 then   
		GiveItem ( role , 0 , 32  , 1 , 95 ) 
		GiveItem ( role , 0 , 311  , 1 , 95 )
		GiveItem ( role , 0 , 489  , 1 , 4 )
		GiveItem ( role , 0 , 663  , 1 , 4 )
		GiveItem ( role , 0 , 439  , 1 , 4 ) 
	elseif job == 4 then  
		GiveItem ( role , 0 , 80  , 1 , 4 )
		GiveItem ( role , 0 , 439  , 1 , 4 ) 
		if cha_type == 1 or cha_type == 3 then 
			GiveItem ( role , 0 , 336  , 1 , 95 )
			GiveItem ( role , 0 , 512  , 1 , 95 )
			GiveItem ( role , 0 , 688  , 1 , 95 )
		else
			GiveItem ( role , 0 , 351  , 1 , 95 ) 
			GiveItem ( role , 0 , 527  , 1 , 95 ) 
			GiveItem ( role , 0 , 703  , 1 , 95 ) 
			GiveItem ( role , 0 , 2188  , 1 , 95 ) 
		end
	elseif job == 5 then
		GiveItem ( role , 0 , 104  , 1 , 95 ) 
		GiveItem ( role , 0 , 439  , 1 , 4 ) 
		if cha_type == 3 then 
			GiveItem ( role , 0 , 372  , 1 , 95 ) 
			GiveItem ( role , 0 , 548  , 1 , 95 ) 
			GiveItem ( role , 0 , 724  , 1 , 95 ) 
		else 
			GiveItem ( role , 0 , 359  , 1 , 95 )
			GiveItem ( role , 0 , 535  , 1 , 95 ) 
			GiveItem ( role , 0 , 711  , 1 , 95 ) 
			GiveItem ( role , 0 , 2196  , 1 , 95 ) 
		end
	else 
		SystemNotice(role ,"�� ��� �� �������� ������ ��������� ")
		UseItemFailed ( role )	
	end
end
----------------------------------+3���˱���
function ItemUse_XRBOX3( role, Item )
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
        local cha_type = GetChaTypeID ( role )
        local cha_type = GetChaTypeID ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 7 then
		SystemNotice(role ,"��� �������� ���������� 6 ��������� ������ ")
		UseItemFailed ( role )
		return
	end
	if lv < 20 then
		SystemNotice(role ,"��������� 20 ������� ")
		UseItemFailed ( role )	
	elseif job == 1 then  
		GiveItem ( role , 0 , 2  , 2 , 95 ) 
		GiveItem ( role , 0 , 291  , 1 , 95 )
		GiveItem ( role , 0 , 467  , 1 , 95 )
		GiveItem ( role , 0 , 643  , 1 , 95 )
		GiveItem ( role , 0 , 3094  , 1 , 4 )
		  
		GiveItem ( role , 0 , 440  , 1 , 4 ) 
	elseif job == 2 then  
		GiveItem ( role , 0 , 26  , 1 , 95 ) 
		GiveItem ( role , 0 , 306  , 1 , 95 )
		GiveItem ( role , 0 , 482  , 1 , 4 )
		GiveItem ( role , 0 , 658  , 1 , 4 )  
		
		GiveItem ( role , 0 , 440  , 1 , 4 ) 
	elseif job == 4 then  
		GiveItem ( role , 0 , 3094  , 1 , 4 )
		  
		GiveItem ( role , 0 , 440  , 1 , 4 ) 
		GiveItem ( role , 0 , 74  , 1 , 95 ) 
		if cha_type == 1 or cha_type == 3 then 
			GiveItem ( role , 0 , 338  , 1 , 95 )
			GiveItem ( role , 0 , 514  , 1 , 95 )
			GiveItem ( role , 0 , 690  , 1 , 95 )
		else
			GiveItem ( role , 0 , 386  , 1 , 95 ) 
			GiveItem ( role , 0 , 562  , 1 , 95 )
			GiveItem ( role , 0 , 738  , 1 , 95 )
			GiveItem ( role , 0 , 2208  , 1 , 95 )
		end
	elseif job == 5 then 
		GiveItem ( role , 0 , 3094  , 1 , 4 )
		  
		GiveItem ( role , 0 , 440  , 1 , 4 ) 
		GiveItem ( role , 0 , 98  , 1 , 95 )
		if cha_type == 3 then 
			GiveItem ( role , 0 , 366  , 1 , 95 )
			GiveItem ( role , 0 , 542  , 1 , 95 )
			GiveItem ( role , 0 , 718  , 1 , 95 )
		else 
			GiveItem ( role , 0 , 381  , 1 , 95 )
			GiveItem ( role , 0 , 557  , 1 , 95 )
			GiveItem ( role , 0 , 733  , 1 , 95 )
			GiveItem ( role , 0 , 2203  , 1 , 95 )
		end
	else 
		SystemNotice(role ,"�� ��� �� �������� ������ ��������� ")
		UseItemFailed ( role )	
	end
end
----------------------------------+4���˱���
function ItemUse_XRBOX4( role, Item )
local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
        local cha_type = GetChaTypeID ( role )
        local cha_type = GetChaTypeID ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 7 then
		SystemNotice(role ,"��� �������� ���������� 6 ��������� ������ ")
		UseItemFailed ( role )
		return
	end
	if lv < 25 then
		SystemNotice(role ,"��������� 25 ������� ")
		UseItemFailed ( role )	
	elseif job == 1 then  
		GiveItem ( role , 0 , 11  , 2 , 95 ) 
		GiveItem ( role , 0 , 14  , 1 , 95 )
		GiveItem ( role , 0 , 297  , 1 , 95 )
		GiveItem ( role , 0 , 468  , 1 , 95 )
		GiveItem ( role , 0 , 649  , 1 , 4 )
		  
		GiveItem ( role , 0 , 441  , 1 , 4 ) 
	elseif job == 2 then  
		GiveItem ( role , 0 , 33  , 1 , 95 ) 
		GiveItem ( role , 0 , 37  , 1 , 95 ) 
		GiveItem ( role , 0 , 313  , 1 , 95 )
		GiveItem ( role , 0 , 487  , 1 , 4 )
		GiveItem ( role , 0 , 665  , 1 , 4 )  
		
		GiveItem ( role , 0 , 441  , 1 , 4 ) 
	elseif job == 4 then  
		GiveItem ( role , 0 , 3094  , 1 , 4 )
		  
		GiveItem ( role , 0 , 441  , 1 , 4 ) 
		GiveItem ( role , 0 , 81  , 1 , 95 ) 
		if cha_type == 1 or cha_type == 3 then 
			GiveItem ( role , 0 , 337  , 1 , 95 )
			GiveItem ( role , 0 , 513  , 1 , 95 )
			GiveItem ( role , 0 , 689  , 1 , 95 )
		else
			GiveItem ( role , 0 , 352  , 1 , 95 ) 
			GiveItem ( role , 0 , 528  , 1 , 95 )
			GiveItem ( role , 0 , 804  , 1 , 95 )
			GiveItem ( role , 0 , 2189  , 1 , 95 )
		end
	elseif job == 5 then 
		GiveItem ( role , 0 , 3094  , 1 , 4 )
		  
		GiveItem ( role , 0 , 441  , 1 , 4 ) 
		GiveItem ( role , 0 , 105  , 1 , 95 )
		if cha_type == 3 then 
			GiveItem ( role , 0 , 373  , 1 , 95 )
			GiveItem ( role , 0 , 549  , 1 , 95 )
			GiveItem ( role , 0 , 725  , 1 , 95 )
		else 
			GiveItem ( role , 0 , 360  , 1 , 95 )
			GiveItem ( role , 0 , 536  , 1 , 95 )
			GiveItem ( role , 0 , 712  , 1 , 95 )
			GiveItem ( role , 0 , 2197  , 1 , 95 )
		end
	else 
		SystemNotice(role ,"�� ��� �� �������� ������ ��������� ")
		UseItemFailed ( role )	
	end
end
----------------------------------+5���˱���
function ItemUse_XRBOX5( role, Item )
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
        local cha_type = GetChaTypeID ( role )
        local cha_type = GetChaTypeID ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 7 then
		SystemNotice(role ,"��� �������� ���������� 6 ��������� ������ ")
		UseItemFailed ( role )
		return
	end
	if lv < 30 then
		SystemNotice(role ,"��������� 30 ������� ")
		UseItemFailed ( role )	
	elseif job == 1 then  
		GiveItem ( role , 0 , 3  , 2 , 95 ) 
		GiveItem ( role , 0 , 293  , 1 , 95 )
		GiveItem ( role , 0 , 469  , 1 , 95 )
		GiveItem ( role , 0 , 645  , 1 , 95 )
		 
		GiveItem ( role , 0 , 442  , 1 , 4 ) 
	elseif job == 2 then 
		GiveItem ( role , 0 , 27  , 1 , 95 ) 
		GiveItem ( role , 0 , 307  , 1 , 95 )
		GiveItem ( role , 0 , 483  , 1 , 95 )
		GiveItem ( role , 0 , 659  , 1 , 95 )
		 
		GiveItem ( role , 0 , 442  , 1 , 4 ) 
	elseif job == 4 then  
		 
		GiveItem ( role , 0 , 442  , 1 , 4 )
		GiveItem ( role , 0 , 75  , 1 , 95 )
		if cha_type == 1 or cha_type == 3 then 
			GiveItem ( role , 0 , 340  , 1 , 95 )
			GiveItem ( role , 0 , 516  , 1 , 95 )
			GiveItem ( role , 0 , 692  , 1 , 95 )
		else 
			GiveItem ( role , 0 , 350  , 1 , 95 ) 
			GiveItem ( role , 0 , 526  , 1 , 95 )
			GiveItem ( role , 0 , 702  , 1 , 95 )
			GiveItem ( role , 0 , 2187  , 1 , 95 )
		end
	elseif job == 5 then
		 
		GiveItem ( role , 0 , 442  , 1 , 4 ) 
		GiveItem ( role , 0 , 99  , 1 , 95 )
		if cha_type == 3 then
			GiveItem ( role , 0 , 368  , 1 , 95 )
			GiveItem ( role , 0 , 544  , 1 , 95 )
			GiveItem ( role , 0 , 720  , 1 , 95 )
		else 
			GiveItem ( role , 0 , 389  , 1 , 95 )
			GiveItem ( role , 0 , 565  , 1 , 95 )
			GiveItem ( role , 0 , 741  , 1 , 95 )
			GiveItem ( role , 0 , 2211  , 1 , 95 )
		end
	else 
		SystemNotice(role ,"�� ��� �� �������� ������ ��������� ")
		UseItemFailed ( role )	
	end
end
----------------------------------+6���˱���
function ItemUse_XRBOX6( role, Item )
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
        local cha_type = GetChaTypeID ( role )
        local cha_type = GetChaTypeID ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 7 then
		SystemNotice(role ,"��� �������� ���������� 6 ��������� ������ ")
		UseItemFailed ( role )
		return
	end
	if lv < 35 then
		SystemNotice(role ,"��������� 35 ������� ")
		UseItemFailed ( role )	
	elseif job == 1 then  
		GiveItem ( role , 0 , 12  , 2 , 95 ) 
		GiveItem ( role , 0 , 298  , 1 , 95 )
		GiveItem ( role , 0 , 474  , 1 , 95 )
		GiveItem ( role , 0 , 650  , 1 , 95 )
		
		GiveItem ( role , 0 , 443  , 1 , 4 ) 
		if cha_type == 2 then
		GiveItem ( role , 0 , 770  , 1 , 4 )
		GiveItem ( role , 0 , 763  , 1 , 4 )
		end
	elseif job == 2 then 
		GiveItem ( role , 0 , 781  , 1 , 95 ) 
		GiveItem ( role , 0 , 28  , 1 , 95 )
		GiveItem ( role , 0 , 777  , 1 , 95 )
		GiveItem ( role , 0 , 490  , 1 , 95 )
		GiveItem ( role , 0 , 666  , 1 , 95 )
		 
		GiveItem ( role , 0 , 443  , 1 , 4 ) 
	elseif job == 4 then  
		 
		GiveItem ( role , 0 , 443  , 1 , 4 )
		GiveItem ( role , 0 , 799  , 1 , 95 )
		if cha_type == 1 or cha_type == 3 then 
			GiveItem ( role , 0 , 803  , 1 , 95 )
			GiveItem ( role , 0 , 515  , 1 , 95 )
			GiveItem ( role , 0 , 691  , 1 , 95 )
		else 
			GiveItem ( role , 0 , 803  , 1 , 95 ) 
			GiveItem ( role , 0 , 530  , 1 , 95 )
			GiveItem ( role , 0 , 706  , 1 , 95 )
			GiveItem ( role , 0 , 2191  , 1 , 95 )
		end
	elseif job == 5 then
		 
		GiveItem ( role , 0 , 443  , 1 , 4 ) 
		GiveItem ( role , 0 , 785  , 1 , 95 )
		if cha_type == 3 then
			GiveItem ( role , 0 , 789  , 1 , 95 )
			GiveItem ( role , 0 , 550  , 1 , 95 )
			GiveItem ( role , 0 , 726  , 1 , 95 )
		else 
			GiveItem ( role , 0 , 789  , 1 , 95 )
			GiveItem ( role , 0 , 537  , 1 , 95 )
			GiveItem ( role , 0 , 713  , 1 , 95 )
			GiveItem ( role , 0 , 2198  , 1 , 95 )
		end
	else 
		SystemNotice(role ,"�� ��� �� �������� ������ ��������� ")
		UseItemFailed ( role )	
	end
end
----------------------------------+7���˱���
function ItemUse_XRBOX7( role, Item )
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
        local cha_type = GetChaTypeID ( role )
        local cha_type = GetChaTypeID ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 7 then
		SystemNotice(role ,"��� �������� ���������� 6 ��������� ������ ")
		UseItemFailed ( role )
		return
	end
	if lv < 40 then
		SystemNotice(role ,"��������� 40 ������� ")
		UseItemFailed ( role )	
	elseif job == 9 then  
		GiveItem ( role , 0 , 4  , 2 , 95 ) 
		GiveItem ( role , 0 , 295  , 1 , 95 )
		GiveItem ( role , 0 , 471  , 1 , 95 )
		GiveItem ( role , 0 , 647  , 1 , 95 ) 
		GiveItem ( role , 0 , 444  , 1 , 95 ) 
	elseif job == 8 then  
		GiveItem ( role , 0 , 15  , 1 , 95 ) 
		GiveItem ( role , 0 , 300  , 1 , 95 )
		GiveItem ( role , 0 , 476  , 1 , 95 )
		GiveItem ( role , 0 , 652  , 1 , 95 ) 
		GiveItem ( role , 0 , 444  , 1 , 95 )
	elseif job == 12 then 
		GiveItem ( role , 0 , 39  , 1 , 95 ) 
		GiveItem ( role , 0 , 310  , 1 , 95 )
		GiveItem ( role , 0 , 486  , 1 , 95 )
		GiveItem ( role , 0 , 662  , 1 , 95 ) 
		GiveItem ( role , 0 , 444  , 1 , 95 )
	elseif job == 13 then  
			GiveItem ( role , 0 , 100  , 1 , 95 )
			GiveItem ( role , 0 , 444  , 1 , 95 )
	if cha_type == 1 or cha_type == 3 then 
			GiveItem ( role , 0 , 370  , 1 , 95 )
			GiveItem ( role , 0 , 546  , 1 , 95 )
			GiveItem ( role , 0 , 722  , 1 , 95 )
		else 
			GiveItem ( role , 0 , 392  , 1 , 95 ) 
			GiveItem ( role , 0 , 568  , 1 , 95 )
			GiveItem ( role , 0 , 744  , 1 , 95 )
			GiveItem ( role , 0 , 2214  , 1 , 95 )
		end
	elseif job == 14 then
			GiveItem ( role , 0 , 101  , 1 , 95 )
			GiveItem ( role , 0 , 444  , 1 , 95 )
		if cha_type == 1 or cha_type == 3 then
			GiveItem ( role , 0 , 367  , 1 , 95 )
			GiveItem ( role , 0 , 543  , 1 , 95 )
			GiveItem ( role , 0 , 719  , 1 , 95 )
		else 
			GiveItem ( role , 0 , 390  , 1 , 95 )
			GiveItem ( role , 0 , 566  , 1 , 95 )
			GiveItem ( role , 0 , 742  , 1 , 95 )
			GiveItem ( role , 0 , 2212  , 1 , 95 )
		end
	elseif job == 16 then
			GiveItem ( role , 0 , 76  , 1 , 95 )
			GiveItem ( role , 0 , 444  , 1 , 95 )
		if cha_type == 1 or cha_type == 3 then 
			GiveItem ( role , 0 , 341  , 1 , 95 )
			GiveItem ( role , 0 , 517  , 1 , 95 )
			GiveItem ( role , 0 , 693  , 1 , 95 )
		else 
			GiveItem ( role , 0 , 353  , 1 , 95 )
			GiveItem ( role , 0 , 529  , 1 , 95 )
			GiveItem ( role , 0 , 705  , 1 , 95 )
			GiveItem ( role , 0 , 2190  , 1 , 95 )
		end
	else 
		SystemNotice(role ,"�� ��� �� �������� ������ ��������� ")
		UseItemFailed ( role )	
	end
end

function ItemUse_XRBOX8( role, Item )
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
        local cha_type = GetChaTypeID ( role )
        local cha_type = GetChaTypeID ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 7 then
		SystemNotice(role ,"��� �������� ���������� 6 ��������� ������ ")
		UseItemFailed ( role )
		return
	end
	if lv < 45 then
		SystemNotice(role ,"��������� 45 ������� ")
		UseItemFailed ( role )	
	elseif job == 9 then  
		GiveItem ( role , 0 , 3671  , 2 , 95 ) 
		GiveItem ( role , 0 , 767  , 1 , 95 )
		GiveItem ( role , 0 , 654  , 1 , 95 )
		GiveItem ( role , 0 , 478  , 1 , 95 ) 
		GiveItem ( role , 0 , 445  , 1 , 95 )
	elseif job == 8 then  
		GiveItem ( role , 0 , 3675  , 1 , 95 ) 
		GiveItem ( role , 0 , 764  , 1 , 95 )
		GiveItem ( role , 0 , 477  , 1 , 95 )
		GiveItem ( role , 0 , 653  , 1 , 95 ) 
		GiveItem ( role , 0 , 445  , 1 , 95 )
	elseif job == 12 then 
		GiveItem ( role , 0 , 3673  , 1 , 95 ) 
		GiveItem ( role , 0 , 778  , 1 , 95 )
		GiveItem ( role , 0 , 491  , 1 , 95 )
		GiveItem ( role , 0 , 667  , 1 , 95 ) 
		GiveItem ( role , 0 , 445  , 1 , 95 )
	elseif job == 13 then  
			GiveItem ( role , 0 , 3577  , 1 , 95 )
			GiveItem ( role , 0 , 445  , 1 , 95 )
	if cha_type == 1 or cha_type == 3 then 
			GiveItem ( role , 0 , 790  , 1 , 95 )
			GiveItem ( role , 0 , 554  , 1 , 95 )
			GiveItem ( role , 0 , 730  , 1 , 95 )
		else 
			GiveItem ( role , 0 , 790  , 1 , 95 ) 
			GiveItem ( role , 0 , 564  , 1 , 95 )
			GiveItem ( role , 0 , 740  , 1 , 95 )
			GiveItem ( role , 0 , 2210  , 1 , 95 )
		end
	elseif job == 14 then
			GiveItem ( role , 0 , 3579  , 1 , 95 )
			GiveItem ( role , 0 , 445  , 1 , 95 )
		if cha_type == 3 then
			GiveItem ( role , 0 , 796  , 1 , 95 )
			GiveItem ( role , 0 , 551  , 1 , 95 )
			GiveItem ( role , 0 , 727  , 1 , 95 )
		else 
			GiveItem ( role , 0 , 796  , 1 , 95 )
			GiveItem ( role , 0 , 538  , 1 , 95 )
			GiveItem ( role , 0 , 714  , 1 , 95 )
			GiveItem ( role , 0 , 2199  , 1 , 95 )
		end
	elseif job == 16 then
			GiveItem ( role , 0 , 3581  , 1 , 95 )
			GiveItem ( role , 0 , 445  , 1 , 95 )
		if cha_type == 3 then
			GiveItem ( role , 0 , 804  , 1 , 95 )
			GiveItem ( role , 0 , 518  , 1 , 95 )
			GiveItem ( role , 0 , 694  , 1 , 95 )
		else 
			GiveItem ( role , 0 , 804  , 1 , 95 )
			GiveItem ( role , 0 , 532  , 1 , 95 )
			GiveItem ( role , 0 , 708  , 1 , 95 )
			GiveItem ( role , 0 , 2193  , 1 , 95 )
		end
	else 
		SystemNotice(role ,"�� ��� �� �������� ������ ��������� ")
		UseItemFailed ( role )	
	end
end

function ItemUse_XRBOX9( role, Item )
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
        local cha_type = GetChaTypeID ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 7 then
		SystemNotice(role ,"��� �������� ���������� 6 ��������� ������")
		UseItemFailed ( role )
		return
	end
	if lv < 55 then
		SystemNotice(role ,"��������� 55 ������� ")
		UseItemFailed ( role )	
	elseif job == 8 then  
		GiveItem ( role , 0 , 772  , 1 , 95 ) 
		GiveItem ( role , 0 , 765 , 1 , 95 ) 
		GiveItem ( role , 0 , 653  , 1 , 95 ) 
		GiveItem ( role , 0 , 477  , 1 , 95 ) 
		GiveItem ( role , 0 , 446  , 1 , 95 )
	elseif job == 9 then  
		GiveItem ( role , 0 , 775  , 1 , 95 ) 
		GiveItem ( role , 0 , 775  , 1 , 95 )
		GiveItem ( role , 0 , 768  , 1 , 95 )
		GiveItem ( role , 0 , 807  , 1 , 95 )
		GiveItem ( role , 0 , 808  , 1 , 95 )
		GiveItem ( role , 0 , 446  , 1 , 95 )
	elseif job == 12 then   
		GiveItem ( role , 0 , 783  , 1 , 95 ) 
		GiveItem ( role , 0 , 118  , 1 , 95 )
		GiveItem ( role , 0 , 779  , 1 , 95 )
		GiveItem ( role , 0 , 809  , 1 , 95 )
		GiveItem ( role , 0 , 810  , 1 , 95 )
		GiveItem ( role , 0 , 446  , 1 , 95 )
	elseif job == 16 then  
		GiveItem ( role , 0 , 801  , 1 , 95 ) 
		GiveItem ( role , 0 , 805  , 1 , 95 ) 
		GiveItem ( role , 0 , 815  , 1 , 95 ) 
		GiveItem ( role , 0 , 877  , 1 , 95 ) 
		GiveItem ( role , 0 , 446  , 1 , 95 )
	elseif job == 13 then    
		GiveItem ( role , 0 , 787  , 1 , 95 ) 
		GiveItem ( role , 0 , 791  , 1 , 95 )
		GiveItem ( role , 0 , 812  , 1 , 95 )
		GiveItem ( role , 0 , 814  , 1 , 95 )
		GiveItem ( role , 0 , 446  , 1 , 95 )
	elseif job == 14 then    
		GiveItem ( role , 0 , 794  , 1 , 95 )
		GiveItem ( role , 0 , 797  , 1 , 95 ) 
		GiveItem ( role , 0 , 811  , 1 , 95 ) 
		GiveItem ( role , 0 , 813  , 1 , 95 ) 
		GiveItem ( role , 0 , 446  , 1 , 95 )
	else 
		SystemNotice(role ,"�� ��� �� �������� ������ ��������� ")
		UseItemFailed ( role )	
	end
end

function ItemUse_XRBOX10( role, Item )
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
        local cha_type = GetChaTypeID ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 7 then
		SystemNotice(role ,"��� �������� ���������� 6 ��������� ������ ")
		UseItemFailed ( role )
		return
	end
	if lv < 65 then
		SystemNotice(role ,"��������� 65 ������� ")
		UseItemFailed ( role )	
	elseif job == 8 then  
		GiveItem ( role , 0 , 773  , 1 , 95 ) 
		GiveItem ( role , 0 , 766 , 1 , 95 ) 
		GiveItem ( role , 0 , 829  , 1 , 95 ) 
		GiveItem ( role , 0 , 603  , 1 , 95 ) 
		GiveItem ( role , 0 , 447  , 1 , 95 )
	elseif job == 9 then  
		GiveItem ( role , 0 , 776  , 1 , 95 ) 
		GiveItem ( role , 0 , 776  , 1 , 95 )
		GiveItem ( role , 0 , 769  , 1 , 95 )
		GiveItem ( role , 0 , 4181  , 1 , 95 )
		GiveItem ( role , 0 , 4165  , 1 , 95 )
		GiveItem ( role , 0 , 447  , 1 , 95 )
	elseif job == 12 then   
		GiveItem ( role , 0 , 784  , 1 , 95 ) 
		GiveItem ( role , 0 , 780  , 1 , 95 )
		GiveItem ( role , 0 , 4183  , 1 , 95 )
		GiveItem ( role , 0 , 4167  , 1 , 95 )
		GiveItem ( role , 0 , 117  , 1 , 95 )
		GiveItem ( role , 0 , 447  , 1 , 95 )
	elseif job == 16 then  
		GiveItem ( role , 0 , 802  , 1 , 95 )
GiveItem ( role , 0 , 447  , 1 , 95 )		
	if cha_type == 1 or cha_type == 3 then
		GiveItem ( role , 0 , 806  , 1 , 95 )
		GiveItem ( role , 0 , 4185  , 1 , 95 )
		GiveItem ( role , 0 , 4169  , 1 , 95 )
		else 
		GiveItem ( role , 0 , 806  , 1 , 95 ) 
		GiveItem ( role , 0 , 4186  , 1 , 95 )
		GiveItem ( role , 0 , 4170  , 1 , 95 )
		GiveItem ( role , 0 , 2222  , 1 , 95 )
		end
	elseif job == 13 then    
			GiveItem ( role , 0 , 788  , 1 , 95 )
			GiveItem ( role , 0 , 447  , 1 , 95 )
	if cha_type == 1 or cha_type == 3 then 
			GiveItem ( role , 0 , 792  , 1 , 95 )
			GiveItem ( role , 0 , 4189  , 1 , 95 )
			GiveItem ( role , 0 , 4173  , 1 , 95 )
		else 
			GiveItem ( role , 0 , 792  , 1 , 95 ) 
			GiveItem ( role , 0 , 4190  , 1 , 95 )
			GiveItem ( role , 0 , 4174  , 1 , 95 )
			GiveItem ( role , 0 , 2220  , 1 , 95 )
			end
	elseif job == 14 then    
			GiveItem ( role , 0 , 795  , 1 , 95 )
			GiveItem ( role , 0 , 447  , 1 , 95 )
	if cha_type == 1 or cha_type == 3 then 
			GiveItem ( role , 0 , 798  , 1 , 95 )
			GiveItem ( role , 0 , 4177  , 1 , 95 )
			GiveItem ( role , 0 , 4193  , 1 , 95 )
		else 
			GiveItem ( role , 0 , 798  , 1 , 95 ) 
			GiveItem ( role , 0 , 4194  , 1 , 95 )
			GiveItem ( role , 0 , 4178  , 1 , 95 )
			GiveItem ( role , 0 , 2218  , 1 , 95 )
			end
			
	else 
		SystemNotice(role ,"�� ��� �� �������� ������ ��������� ")
		UseItemFailed ( role )	
	end
end

function ItemUse_XRBOX11( role, Item )
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
        local cha_type = GetChaTypeID ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 5 then
		SystemNotice(role ,"��� �������� ���������� 4 ��������� ����� ")
		UseItemFailed ( role )
		return
	end
	if lv < 80 then
		SystemNotice(role ,"��������� 80 ������� ")
		UseItemFailed ( role )	
	elseif job == 8 then  
		GiveItem ( role , 0 , 2532  , 1 , 95 ) 
		GiveItem ( role , 0 , 2531 , 1 , 95 ) 
		GiveItem ( role , 0 , 2530  , 1 , 95 ) 
	elseif job == 9 then  
		GiveItem ( role , 0 , 2533  , 1 , 95 ) 
		GiveItem ( role , 0 , 2534  , 1 , 95 )
		GiveItem ( role , 0 , 2535  , 1 , 95 )
	elseif job == 12 then   
		GiveItem ( role , 0 , 2536  , 1 , 95 ) 
		GiveItem ( role , 0 , 2537  , 1 , 95 )
		GiveItem ( role , 0 , 2538  , 1 , 95 )
	elseif job == 16 then  
	if cha_type == 1 or cha_type == 3 then	
		GiveItem ( role , 0 , 2539  , 1 , 95 )
		GiveItem ( role , 0 , 2540  , 1 , 95 )
		GiveItem ( role , 0 , 2541  , 1 , 95 )
		else 
		GiveItem ( role , 0 , 2539  , 1 , 95 )
		GiveItem ( role , 0 , 2540  , 1 , 95 )
		GiveItem ( role , 0 , 2541  , 1 , 95 )
		GiveItem ( role , 0 , 2548  , 1 , 95 )
		end
	elseif job == 13 then    
	if cha_type == 1 or cha_type == 3 then	
			GiveItem ( role , 0 , 2542  , 1 , 95 )
			GiveItem ( role , 0 , 2543  , 1 , 95 )
			GiveItem ( role , 0 , 2544  , 1 , 95 )
			else
			GiveItem ( role , 0 , 2542  , 1 , 95 )
			GiveItem ( role , 0 , 2543  , 1 , 95 )
			GiveItem ( role , 0 , 2544  , 1 , 95 )
			GiveItem ( role , 0 , 2548  , 1 , 95 )
			end
	elseif job == 14 then 
	if cha_type == 1 or cha_type == 3 then		
			GiveItem ( role , 0 , 2545  , 1 , 95 )
			GiveItem ( role , 0 , 2546  , 1 , 95 )
			GiveItem ( role , 0 , 2547  , 1 , 95 )	
			else
			GiveItem ( role , 0 , 2545  , 1 , 95 )
			GiveItem ( role , 0 , 2546  , 1 , 95 )
			GiveItem ( role , 0 , 2547  , 1 , 95 )	
			GiveItem ( role , 0 , 2548  , 1 , 95 )
			end
	else 
		SystemNotice(role ,"�� ��� �� �������� ������ ��������� ")
		UseItemFailed ( role )	
	end
end
--------------------------------------------------------------------------------------------------
--������
--------------------------------------------------------------------------------------------------

--������ (ID 0263)
function ItemUse_ZhongZi ( role , Item ) 
	local hp = GetChaAttr(role, ATTR_HP)  
	if hp <= 0 then   
	end 
	hp_resume = 1000   
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then 
		hp = mxhp 
	end 
	SetCharaAttr(hp, role, ATTR_HP) 
end 

--��������� ���� (ID 0264)
function ItemUse_XiongHJ ( role , Item ) 
	local statelv = 1
	local statetime = 1800
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_PKSFYS , statelv , statetime )
	else
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end 

--�������� ������ (ID 0265)
function ItemUse_AiCao ( role , Item )  
	local statelv = 1
	local statetime = 180
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_PKSBYS , statelv , statetime )
	else
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end 

--����������� ������ (ID 0459)
function ItemUse_FLeiBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	local BNUM = B1+B2+B3+B4+B5+B6+B7+B8+B9+B10+B11+B12+B13+B14+B15
	if Item_CanGet < BNUM then
		SystemNotice(role ,"\215\242\238\225\251 \238\242\234\240\251\242\252 \202\240\238\226\238\230\224\228\237\251\233 \241\243\237\228\243\234 \242\240\229\225\243\229\242\241\255"..BNUM.."\241\235\238\242\238\226 \226 \232\237\226\229\237\242\224\240\229 ")
		--SystemNotice(role ,"����� ������� ����������� ������ ��������� "..BNUM.." ������ � ��������� ")
		--SystemNotice(role ,"To open a Tempest Chest requires"..BNUM.."space ")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , A1 , B1 , 4 )
	GiveItem ( role , 0 , A2 , B2 , 4 )
	GiveItem ( role , 0 , A3 , B3 , 4 )
	GiveItem ( role , 0 , A4 , B4 , 4 )
	GiveItem ( role , 0 , A5 , B5 , 4 )
	GiveItem ( role , 0 , A6 , B6 , 4 )
	GiveItem ( role , 0 , A7 , B7 , 4 )
	GiveItem ( role , 0 , A8 , B8 , 4 )
	GiveItem ( role , 0 , A9 , B9 , 4 )
	GiveItem ( role , 0 , A10 , B10 , 4 )
	GiveItem ( role , 0 , A11 , B11 , 4 )
	GiveItem ( role , 0 , A12 , B12 , 4 )
	GiveItem ( role , 0 , A13 , B13 , 4 )
	GiveItem ( role , 0 , A14 , B14 , 4 )
	GiveItem ( role , 0 , A15 , B15 , 4 )
	GiveItem ( role , 0 , A16 , B16 , 4 )
	GiveItem ( role , 0 , A17 , B17 , 4 )
	GiveItem ( role , 0 , A18 , B18 , 4 )
	GiveItem ( role , 0 , A19 , B19 , 4 )
	GiveItem ( role , 0 , A20 , B20 , 4 )
	GiveItem ( role , 0 , A21 , B21 , 4 )
	GiveItem ( role , 0 , A22 , B22 , 4 )
	GiveItem ( role , 0 , A23 , B23 , 4 )
	GiveItem ( role , 0 , A24 , B24 , 4 )
end
	 
--��� ������������ (ID 2315)
function ItemUse_CJBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <1 then
		SystemNotice(role ,"\210\240\229\225\243\229\242\241\255 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \194\224\248\229\236 \232\237\226\229\237\242\224\240\229, \247\242\238\225\251 \232\241\239\238\235\252\231\238\226\224\242\252 \209\243\239 \239\229\240\229\240\238\230\228\229\237\232\255")
		--SystemNotice(role ,"��������� 1 ��������� ���� � ����� ���������, ����� ������������ ��� ������������")
		--SystemNotice(role ,"To open a Chest requires 1 empty slot")
		UseItemFailed ( role )
		return
	end
	local r1,r2 =MakeItem ( role , C1  , 1 , 4 )
	local Item_newJL = GetChaItem ( role , 2 , r2 )
	local Item_newJLID = GetItemID ( Item_newJL )


	
	local con_JLone = GetItemAttr( Item_newJL ,ITEMATTR_VAL_CON )
	local agi_JLone = GetItemAttr( Item_newJL ,ITEMATTR_VAL_AGI )
	local dex_JLone = GetItemAttr( Item_newJL ,ITEMATTR_VAL_DEX )
	local sta_JLone = GetItemAttr( Item_newJL ,ITEMATTR_VAL_STA )

	local Num_JL = GetItemForgeParam ( Item_newJL , 1 )
	Num_JL = TansferNum ( Num_JL )
	local Part1_JL = GetNum_Part1 ( Num_JL )
	local Part2_JL = GetNum_Part2 ( Num_JL )	
	local Part3_JL = GetNum_Part3 ( Num_JL )
	local Part4_JL = GetNum_Part4 ( Num_JL )
	local Part5_JL = GetNum_Part5 ( Num_JL )
	local Part6_JL = GetNum_Part6 ( Num_JL )
	local Part7_JL = GetNum_Part7 ( Num_JL )
	if Item_newJLID==231 or Item_newJLID==232 or Item_newJLID==233 or Item_newJLID==234 or Item_newJLID==235  or Item_newJLID==236  or Item_newJLID==237  or Item_newJLID==681 then
		Part1_JL=1
		Num_JL = SetNum_Part1 ( Num_JL , 1 )
		SetItemForgeParam ( Item_newJL , 1 , Num_JL )
	end
	str_JLone	= N1
	con_JLone = N2
	agi_JLone	= N3
	dex_JLone = N4
	sta_JLone	= N5
	local new_lv=N1+N2+N3+N4+N5
	local new_MAXENERGY = 240 * ( new_lv + 1 )
	if new_MAXENERGY > 6480 then
		new_MAXENERGY = 6480
	end
	local new_MAXURE = 5000 + 1000*new_lv
	if new_MAXURE > 32000 then
		new_MAXURE = 32000
	end
	SetItemAttr ( Item_newJL ,ITEMATTR_VAL_STR , str_JLone )
	SetItemAttr ( Item_newJL ,ITEMATTR_VAL_CON , con_JLone )
	SetItemAttr ( Item_newJL ,ITEMATTR_VAL_AGI , agi_JLone )
	SetItemAttr ( Item_newJL ,ITEMATTR_VAL_DEX , dex_JLone)
	SetItemAttr ( Item_newJL ,ITEMATTR_VAL_STA , sta_JLone)
	SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
	SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
	SetItemAttr ( Item_newJL , ITEMATTR_ENERGY , new_MAXENERGY ) 	
	SetItemAttr ( Item_newJL , ITEMATTR_URE , new_MAXURE )
	local cha_name = GetChaDefaultName ( role )
	--LG( "star_JLZS_lg" ,cha_name,Item_JLone_ID , lv_JLone , str_JLone , con_JLone , agi_JLone , dex_JLone , sta_JLone , Item_JLother_ID , lv_JLother  , str_JLother , con_JLother , agi_JLother , dex_JLother , sta_JLother )
	LG( "star_CJBOX" ,cha_name, C1 , N1 , N2 ,  N3 , N4 , N5 )

end

--������ �������� (ID 0460)
function ItemUse_YZheBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 8 then
		SystemNotice(role ,"\215\242\238\225\251 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \215\229\236\239\232\238\237\224 \242\240\229\225\243\229\242\241\255 8 \241\226\238\225\238\228\237\251\245 \241\235\238\242\238\226 \226 \194\224\248\229\236 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"����� ������� ������ �������� ��������� 8 ��������� ������ � ����� ���������")
		--SystemNotice(role ,"To open a Champion's Chest requires 8 empty slots")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 453 , 1 , 4 )
	GiveItem ( role , 0 , 454 , 1 , 4 )
	GiveItem ( role , 0 , 455 , 1 , 4 )
	GiveItem ( role , 0 , 456 , 1 , 4 )
	local rad = math.random ( 1, 8 )
	if rad == 1 then
	GiveItem ( role , 0 , 5013  , 1 , 4 ) 
	GiveItem ( role , 0 , 5021  , 1 , 4 ) 
	GiveItem ( role , 0 , 5029  , 1 , 4 ) 
	elseif rad == 2 then
	GiveItem ( role , 0 , 5014  , 1 , 4 ) 
	GiveItem ( role , 0 , 5022  , 1 , 4 ) 
	GiveItem ( role , 0 , 5030  , 1 , 4 ) 
	elseif rad == 3 then
	GiveItem ( role , 0 , 5015  , 1 , 4 ) 
	GiveItem ( role , 0 , 5023  , 1 , 4 ) 
	GiveItem ( role , 0 , 5031  , 1 , 4 ) 
	elseif rad == 4 then
	GiveItem ( role , 0 , 5016  , 1 , 4 ) 
	GiveItem ( role , 0 , 5024  , 1 , 4 ) 
	GiveItem ( role , 0 , 5032  , 1 , 4 ) 
	GiveItem ( role , 0 , 5037  , 1 , 4 ) 
	elseif rad == 5 then
	GiveItem ( role , 0 , 5017  , 1 , 4 ) 
	GiveItem ( role , 0 , 5025  , 1 , 4 ) 
	GiveItem ( role , 0 , 5033  , 1 , 4 )
	elseif rad == 6 then
	GiveItem ( role , 0 , 5018  , 1 , 4 ) 
	GiveItem ( role , 0 , 5026  , 1 , 4 ) 
	GiveItem ( role , 0 , 5034  , 1 , 4 )
	elseif rad == 7 then
	GiveItem ( role , 0 , 5019  , 1 , 4 ) 
	GiveItem ( role , 0 , 5027  , 1 , 4 ) 
	GiveItem ( role , 0 , 5035  , 1 , 4 )
	elseif rad == 8 then
	GiveItem ( role , 0 , 5020  , 1 , 4 ) 
	GiveItem ( role , 0 , 5028  , 1 , 4 ) 
	GiveItem ( role , 0 , 5036  , 1 , 4 )
	GiveItem ( role , 0 , 5038  , 1 , 4 )
	end
end

--------------------------------------------------------------------------------------------------
--��������-��������� ������
--------------------------------------------------------------------------------------------------

--��������� ���������� (ID 3094)
function ItemUse_MoreExpGzA( role , Item )
		local Lv = Lv( role )
		if Lv < 1 then
		SystemNotice(role ,"\210\238\235\252\234\238 \232\227\240\238\234\232 \243\240\238\226\237\255 1 \232 \226\251\248\229 \236\238\227\243\242 \232\241\239\238\235\252\231\238\226\224\242\252 \209\243\239\229\240 \211\241\232\235\232\242\229\235\252 \241\242\240\229\236\235\229\237\232\233")
		--SystemNotice(role ,"������ ������ ������ 60 � ���� ����� ������������ ����� ��������� ����������")
		--SystemNotice(role ,"Only Lv 60 and above may use")
		UseItemFailed ( role )
		return
	end

	local statelv = 1
    local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
    if ChaStateLv >= statelv then
        SystemNotice ( role , "����� ����������� ��� ����������� ��������� ����� ��� ������������" )
        UseItemFailed ( role )
        return
    end
    local statetime = 600
    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
    if Cha_Boat ==  nil then
        AddState( role , role , STATE_SBJYGZ , statelv , statetime )
		EffectPanel_Add(role, "STATE_SBJYGZ", statelv, "n1396", EffectPanel_TimeConvertor(statetime))
    else
        AddState( Cha_Boat , Cha_Boat , STATE_SBJYGZ , statelv , statetime )
		EffectPanel_Add(role, "STATE_SBJYGZ", statelv, "n1396", EffectPanel_TimeConvertor(statetime))
    end
    SystemNotice ( role ,"\207\238\235\243\247\224\229\236\251\233 \238\239\251\242 \243\226\229\235\232\247\229\237 \226 2 \240\224\231\224 " )
	local effect = 943              -- ID ������� �� sceneffectinfo.txt
    PlayEffect (role, effect )      -- ���������� ����������� ������ ��� �������� �������
end

--������� ��������� ���������� (ID 3095)
function ItemUse_MoreExpGzLv3A( role , Item )
		local Lv = Lv( role )
		if Lv < 100 then
		SystemNotice(role ,"\210\238\235\252\234\238 \232\227\240\238\234\232 \243\240\238\226\237\255 100 \232 \226\251\248\229 \236\238\227\243\242 \232\241\239\238\235\252\231\238\226\224\242\252 \193\238\235\252\248\238\233 \211\241\232\235\232\242\229\235\252 \209\242\240\229\236\235\229\237\232\233")
		--SystemNotice(role ,"������ ������ ������ 60 � ���� ����� ������������ ����� ��������� ����������")
		--SystemNotice(role ,"Only Lv 60 and above may use")
		UseItemFailed ( role )
		return
	end

	local statelv = 3
    local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
    if ChaStateLv >= statelv then
        SystemNotice ( role , "����� ����������� ��� ����������� ��������� ����� ��� ������������" )
        UseItemFailed ( role )
        return
    end
    local statetime = 600
    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
    if Cha_Boat ==  nil then
        AddState( role , role , STATE_SBJYGZ , statelv , statetime )
		EffectPanel_Add(role, "STATE_SBJYGZ", statelv, "n1397", EffectPanel_TimeConvertor(statetime))
    else
        AddState( Cha_Boat , Cha_Boat , STATE_SBJYGZ , statelv , statetime )
		EffectPanel_Add(role, "STATE_SBJYGZ", statelv, "n1397", EffectPanel_TimeConvertor(statetime))
    end
    SystemNotice ( role ,"\207\238\235\243\247\224\229\236\251\233 \238\239\251\242 \243\226\229\235\232\247\229\237 \226 2.5 \240\224\231\224 " )
	local effect = 943              -- ID ������� �� sceneffectinfo.txt
    PlayEffect (role, effect )      -- ���������� ����������� ������ ��� �������� �������
end
--��������� ����� (ID 3096)
function ItemUse_MoreItemGzA( role , Item )
    local statelv = 1
    local ChaStateLv = GetChaStateLv ( role , STATE_SBBLGZ )
    if ChaStateLv >= statelv then
        SystemNotice ( role , "����� ����������� ��� ����������� ��������� ����� ��� ������������" )
        UseItemFailed ( role )
        return
    end
    local statetime = 600
    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
    if Cha_Boat ==  nil then
        AddState( role , role , STATE_SBBLGZ , statelv , statetime )
		EffectPanel_Add(role, "STATE_SBBLGZ", statelv, "n1398", EffectPanel_TimeConvertor(statetime))
    else
        AddState( Cha_Boat , Cha_Boat , STATE_SBBLGZ , statelv , statetime )
		EffectPanel_Add(role, "STATE_SBBLGZ", statelv, "n1398", EffectPanel_TimeConvertor(statetime))
    end
    SystemNotice ( role ,"���� ��������� ����� �������� � 2 ���� " )
	local effect = 812              -- ID ������� �� sceneffectinfo.txt
    PlayEffect (role, effect )      -- ���������� ����������� ������ ��� �������� �������
end

--������� ��������� ����� (ID 3097)
function ItemUse_MoreItemGzLv3A( role , Item )
	   local statelv = 3
    local ChaStateLv = GetChaStateLv ( role , STATE_SBBLGZ )
    if ChaStateLv >= statelv then
        SystemNotice ( role , "����� ����������� ��� ����������� ��������� ����� ��� ������������" )
        UseItemFailed ( role )
        return
    end
    local statetime = 600
    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
    if Cha_Boat ==  nil then
        AddState( role , role , STATE_SBBLGZ , statelv , statetime )
		EffectPanel_Add(role, "STATE_SBBLGZ", statelv, "n1355", EffectPanel_TimeConvertor(statetime))
    else
        AddState( Cha_Boat , Cha_Boat , STATE_SBBLGZ , statelv , statetime )
		EffectPanel_Add(role, "STATE_SBBLGZ", statelv, "n1355", EffectPanel_TimeConvertor(statetime))
    end
    SystemNotice ( role ," ���� ��������� ����� �������� � 3 ���� " )
	local effect = 812              -- ID ������� �� sceneffectinfo.txt
    PlayEffect (role, effect )      -- ���������� ����������� ������ ��� �������� �������
end

--���� �4
function ItemUse_dropitem( role , Item )
	local statelv = 5
    local ChaStateLv = GetChaStateLv ( role , STATE_SBBLGZ )
    if ChaStateLv >= statelv then
        SystemNotice ( role , "����� ����������� ��� ����������� ��������� ����� ��� ������������" )
        UseItemFailed ( role )
        return
    end
    local statetime = 600
    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
    if Cha_Boat ==  nil then
        AddState( role , role , STATE_SBBLGZ , statelv , statetime )
    else
        AddState( Cha_Boat , Cha_Boat , STATE_SBBLGZ , statelv , statetime )
    end
    SystemNotice ( role ,"���� ��������� ����� �������� � 4 ���� " )
	local effect = 812              -- ID ������� �� sceneffectinfo.txt
    PlayEffect (role, effect )      -- ���������� ����������� ������ ��� �������� �������
end

--------------------------------------------------------------------------------------------------
--�����\��������
--------------------------------------------------------------------------------------------------

--����� �������������� ������������ (ID 3098)
function ItemUse_TLHFJA( role , Item )
	local hp = GetChaAttr(role, ATTR_HP) 
	local mxhp = GetChaAttr(role,ATTR_MXHP) 	
	hp = hp + 0.05*mxhp 

	if hp > mxhp then 
		hp = mxhp 
	end 
	SetCharaAttr(hp, role, ATTR_HP)
	local effect = 803              -- ID ������� �� sceneffectinfo.txt
    PlayEffect (role, effect )      -- ���������� ����������� ������ ��� ��������
end

--SP ������ ���� (ID 3099)--7578
function ItemUse_TMLGZA( role , Item ) 
	local sp = GetChaAttr(role, ATTR_SP) 
	local mxsp = GetChaAttr(role,ATTR_MXSP) 	
	sp = sp + 0.05*mxsp 

	if sp > mxsp then 
		sp = mxsp 
	end 
	SetCharaAttr(sp, role, ATTR_SP)
 local effect = 924              -- ID ������� �� sceneffectinfo.txt
    PlayEffect (role, effect )      -- ���������� ����������� ������ ��� ��������
end 

--����� �������������� ������������ (ID 3098)
function ItemUse_TLHtim( role , Item )
	local hp = GetChaAttr(role, ATTR_HP) 
	local mxhp = GetChaAttr(role,ATTR_MXHP) 	
	hp = hp + 0.1*mxhp 

	if hp > mxhp then 
		hp = mxhp 
	end 
	SetCharaAttr(hp, role, ATTR_HP)
	local effect = 803              -- ID ������� �� sceneffectinfo.txt
    PlayEffect (role, effect )      -- ���������� ����������� ������ ��� ��������
end

--SP ������ ���� (ID 3099)--7578
function ItemUse_TMLtim( role , Item ) 
	local sp = GetChaAttr(role, ATTR_SP) 
	local mxsp = GetChaAttr(role,ATTR_MXSP) 	
	sp = sp + 0.1*mxsp 

	if sp > mxsp then 
		sp = mxsp 
	end 
	SetCharaAttr(sp, role, ATTR_SP)
 local effect = 924              -- ID ������� �� sceneffectinfo.txt
    PlayEffect (role, effect )      -- ���������� ����������� ������ ��� ��������
end 


--������� ���� (ID 3100)
function ItemUse_SPXsyjA( role , Item )
	
	local OtherStateLv = 0
	local i = 0
	local State_Num = 3
	local State = {}
	State [0] = GetChaStateLv ( role , STATE_YSMJQH )
	State [1] = GetChaStateLv ( role , STATE_YSLQQH )
	State [2] = GetChaStateLv ( role , STATE_YSTZQH )
	State [3] = GetChaStateLv ( role , STATE_YSJSQH )

	for i = 0 , State_Num , 1 do
		if State[i] >= 1 then
			OtherStateLv = OtherStateLv + 1
		end
	end



	if OtherStateLv > 0 then
		SystemNotice(role ,"\221\244\244\229\234\242 \228\224\237\237\238\227\238 \231\229\235\252\255 \237\229 \241\238\247\232\242\224\229\242\241\255 \241 \253\244\244\229\234\242\224\236\232 \238\242 \228\240\243\227\232\245 \231\229\235\232\233")
		--SystemNotice(role ,"������ ������� ����� �� ���������� � ��������� �� ������ �����")
		--SystemNotice(role ,"Potions effect for attribute bonus cannot be stacked")
		UseItemFailed ( role )
		return
	end	

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end


	local statelv = 1
	local statetime = 5400
	AddState( role , role , STATE_YSLLQH , statelv , statetime )

end

--�������  �������� (ID 3101)
function ItemUse_SPLhyjA( role , Item )
	local OtherStateLv = 0
	local i = 0
	local State_Num = 3
	local State = {}
	State [0] = GetChaStateLv ( role , STATE_YSLQQH )
	State [1] = GetChaStateLv ( role , STATE_YSTZQH )
	State [2] = GetChaStateLv ( role , STATE_YSJSQH )
	State [3] = GetChaStateLv ( role , STATE_YSLLQH )

	for i = 0 , State_Num , 1 do
		if State[i] >= 1 then
			OtherStateLv = OtherStateLv + 1
		end
	end



	if OtherStateLv > 0 then
		SystemNotice(role ,"\221\244\244\229\234\242 \228\224\237\237\238\227\238 \231\229\235\252\255 \237\229 \241\238\247\232\242\224\229\242\241\255 \241 \253\244\244\229\234\242\224\236\232 \238\242 \228\240\243\227\232\245 \231\229\235\232\233")
		--SystemNotice(role ,"������ ������� ����� �� ���������� � ��������� �� ������ �����")
		--SystemNotice(role ,"Potions effect for attribute bonus cannot be stacked")
		UseItemFailed ( role )
		return
	end
	
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end

	local statelv = 1
	local statetime = 5400
	AddState( role , role , STATE_YSMJQH , statelv , statetime )

end

--������� ���� (ID 3103)
function ItemUse_SPYyyjA( role , Item )
	local OtherStateLv = 0
	local i = 0
	local State_Num = 3
	local State = {}
	State [0] = GetChaStateLv ( role , STATE_YSMJQH )
	State [1] = GetChaStateLv ( role , STATE_YSTZQH )
	State [2] = GetChaStateLv ( role , STATE_YSJSQH )
	State [3] = GetChaStateLv ( role , STATE_YSLLQH )

	for i = 0 , State_Num , 1 do
		if State[i] >= 1 then
			OtherStateLv = OtherStateLv + 1
		end
	end



	if OtherStateLv > 0 then
		SystemNotice(role ,"\221\244\244\229\234\242 \228\224\237\237\238\227\238 \231\229\235\252\255 \237\229 \241\238\247\232\242\224\229\242\241\255 \241 \253\244\244\229\234\242\224\236\232 \238\242 \228\240\243\227\232\245 \231\229\235\232\233")
		--SystemNotice(role ,"������ ������� ����� �� ���������� � ��������� �� ������ �����")
		--SystemNotice(role ,"Potions effect for attribute bonus cannot be stacked")
		UseItemFailed ( role )
		return
	end

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end


	local statelv = 1
	local statetime = 5400
	AddState( role , role , STATE_YSLQQH , statelv , statetime )

end

--������� ���� (ID 3102)
function ItemUse_SPMnyjA( role , Item )
	
	local OtherStateLv = 0
	local i = 0
	local State_Num = 3
	local State = {}
	State [0] = GetChaStateLv ( role , STATE_YSMJQH )
	State [1] = GetChaStateLv ( role , STATE_YSLQQH )
	State [2] = GetChaStateLv ( role , STATE_YSJSQH )
	State [3] = GetChaStateLv ( role , STATE_YSLLQH )

	for i = 0 , State_Num , 1 do
		if State[i] >= 1 then
			OtherStateLv = OtherStateLv + 1
		end
	end



	if OtherStateLv > 0 then
		SystemNotice(role ,"\221\244\244\229\234\242 \228\224\237\237\238\227\238 \231\229\235\252\255 \237\229 \241\238\247\232\242\224\229\242\241\255 \241 \253\244\244\229\234\242\224\236\232 \238\242 \228\240\243\227\232\245 \231\229\235\232\233")
		--SystemNotice(role ,"������ ������� ����� �� ���������� � ��������� �� ������ �����")
		--SystemNotice(role ,"Potions effect for attribute bonus cannot be stacked")
		UseItemFailed ( role )
		return
	end

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end


	local statelv = 1
	local statetime = 5400
	AddState( role , role , STATE_YSTZQH , statelv , statetime )

end

--������� ���� (ID 3104)
function ItemUse_SPSlyjA( role , Item )
	
	local OtherStateLv = 0
	local i = 0
	local State_Num = 3
	local State = {}
	State [0] = GetChaStateLv ( role , STATE_YSMJQH )
	State [1] = GetChaStateLv ( role , STATE_YSLQQH )
	State [2] = GetChaStateLv ( role , STATE_YSTZQH )
	State [3] = GetChaStateLv ( role , STATE_YSLLQH )

	for i = 0 , State_Num , 1 do
		if State[i] >= 1 then
			OtherStateLv = OtherStateLv + 1
		end
	end


	if OtherStateLv > 0 then
		SystemNotice(role ,"\221\244\244\229\234\242 \228\224\237\237\238\227\238 \231\229\235\252\255 \237\229 \241\238\247\232\242\224\229\242\241\255 \241 \253\244\244\229\234\242\224\236\232 \238\242 \228\240\243\227\232\245 \231\229\235\232\233")
		--SystemNotice(role ,"������ ������� ����� �� ���������� � ��������� �� ������ �����")
		--SystemNotice(role ,"Potions effect for attribute bonus cannot be stacked")
		UseItemFailed ( role )
		return
	end

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end


	local statelv = 1
	local statetime = 5400
	AddState( role , role , STATE_YSJSQH , statelv , statetime )

end

--����� ���������� (ID 3105)
function ItemUse_MspdYSA ( role , Item )
	local statelv = 1
	local statetime = 9800
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_YSMspd , statelv , statetime )
	else
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end

end

--����� �������� (ID 0850)
function ItemUse_MspdYSB ( role , Item )
	local statelv = 1
	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		Rem_State_StarUnnormal ( role )
		AddState( role , role , STATE_QINGZ , statelv , statetime )
	else
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

--����������� ����� (ID3106)
function ItemUse_GJZhuangJiaA ( role , Item )
	local statelv = 1
	local statetime = 1800
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~=  nil then
		AddState( Cha_Boat , Cha_Boat , STATE_YSBoatDEF , statelv , statetime )
	else
		SystemNotice( role , "\204\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238 \242\238\235\252\234\238 \226 \236\238\240\229" )
		--SystemNotice( role , "����� ���� ������������ ������ � ����" )
		--SystemNotice( role , "Only can be used while sailing" )
		UseItemFailed ( role )
		return
	end

end

--������������ ����� (ID 3107)
function ItemUse_DenglongA ( role , Item )
	local statelv = 1
	local statetime = 300
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_DENGLONG , statelv , statetime )
	else
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

--������ ������ (ID 0852)
function ItemUse_DenglongB ( role , Item )
	local statelv = 1
	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		Rem_State_StarUnnormal ( role )
		AddState( role , role , STATE_QUANS , statelv , statetime )
	else
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

--------------------------------------------------------------------------------------------------
--������
--------------------------------------------------------------------------------------------------

--������� � ��������� (ID 3048)
function Jz_Script_ltcsA(role, Item )
	local i = CheckBagItem(role,3048)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3048,1)
			if j == 1 then
				MoveCity(role,"Thundoria Castle")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������ � ���� ���������� (ID 3049)
function Jz_Script_ltjgcsA(role, Item )
	local i = CheckBagItem(role,3049)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3049,1)
			if j == 1 then
				MoveCity(role,"Thundoria Harbor")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� � ��������� ������� ���� (ID 3050)
function Jz_Script_sxscsA(role, Item )
	local i = CheckBagItem(role,3050)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3050,1)
			if j == 1 then
				MoveCity(role,"Sacred Snow Mountain")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� � ��������� ��� (ID 3051)
function Jz_Script_laslcsA(role, Item )
	local i = CheckBagItem(role,3051)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3051,1)
			if j == 1 then
				MoveCity(role,"Andes Forest Haven")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� � ����� (ID 3052)
function Jz_Script_sqcsA(role, Item )
	local i = CheckBagItem(role,3052)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3052,1)
			if j == 1 then
				MoveCity(role,"Oasis Haven")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� � �������� ���� (ID 3053)
function Jz_Script_bjcsA(role, Item )
	local i = CheckBagItem(role,3053)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3053,1)
			if j == 1 then
				MoveCity(role,"Icespire Haven")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� � �������� ����� (ID 3054)
function Jz_Script_jmztcsA(role, Item )
	local i = CheckBagItem(role,3054)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3054,1)
			if j == 1 then
				MoveCity(role,"Lone Tower Entrace")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--����� ������ (ID 3055)
function Jz_Script_scrkcsA(role, Item )
	local i = CheckBagItem(role,3055)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3055,1)
			if j == 1 then
				MoveCity(role,"Barren Cavern Entrance")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������ � ����������� ����� 2 (ID 3056)
function Jz_Script_fk2csA(role, Item )
	local i = CheckBagItem(role,3056)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3056,1)
			if j == 1 then
				MoveCity(role,"Abandon Mine 2")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� � ���������� ����� 2 (ID 3057)
function Jz_Script_yk2csA(role, Item )
	local i = CheckBagItem(role,3057)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3057,1)
			if j == 1 then
				MoveCity(role,"Silver Mine 2")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� � ���������� ����� 3 (ID 3058)
function Jz_Script_yk3csA(role, Item )
	local i = CheckBagItem(role,3058)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3058,1)
			if j == 1 then
				MoveCity(role,"Silver Mine 3")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--����� � �������� ����� 2 (ID 3059)
function Jz_Script_jmzt2csA(role, Item )
	local i = CheckBagItem(role,3059)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3059,1)
			if j == 1 then
				MoveCity(role,"Lone Tower 2")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� � �������� ����� 3 (ID 3060)
function Jz_Script_jmzt3csA(role, Item )
	local i = CheckBagItem(role,3060)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3060,1)
			if j == 1 then
				MoveCity(role,"Lone Tower 3")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� � �������� ����� 4 (ID 3070)
function Jz_Script_jmzt4csA(role, Item )
	local i = CheckBagItem(role,3070)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3070,1)
			if j == 1 then
				MoveCity(role,"Lone Tower 4")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� � �������� ����� 5 (ID 3071)
function Jz_Script_jmzt5csA(role, Item )
	local i = CheckBagItem(role,3071)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3071,1)
			if j == 1 then
				MoveCity(role,"Lone Tower 5")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� � �������� ����� 6 (ID 3072)
function Jz_Script_jmzt6csA(role, Item )
	local i = CheckBagItem(role,3072)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3072,1)
			if j == 1 then
				MoveCity(role,"Lone Tower 6")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� � ����������� ����� 1 (ID 3073)
function Jz_Script_fk1csA(role, Item )
	local i = CheckBagItem(role,3073)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return

	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3073,1)
			if j == 1 then
				MoveCity(role,"Abandon Mine 1")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� � ��������� (ID 3076)
function Jz_Script_cfzsA(role, Item )
	local i = CheckBagItem(role,3076)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3076,1)
			if j == 1 then
				MoveCity(role,"Spring Town")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--------------------------------------------------------------------------------------------------
--������ ������ ������\���� ��� ����������
--------------------------------------------------------------------------------------------------

--������ ������ ������ (ID 0266)
function ItemUse_CiChang( role, Item )
	local Elf_URE = GetItemAttr(Item,ITEMATTR_URE)
	local Elf_EXP = GetItemAttr(Item,ITEMATTR_ENERGY)
	if Elf_URE ~= 0 then
		SystemNotice(role ,"\207\229\247\224\242\232 \237\229 \225\251\235\232 \241\237\255\242\251 ")
		--SystemNotice(role ,"������ �� ���� �����")
		--SystemNotice(role ,"Seal has not been broken")
		UseItemFailed ( role )
		return
	end
	if Elf_EXP >0 then
		SystemNotice(role ,"\206\247\234\238\226 \239\240\238\234\235\255\242\232\233 \225\238\235\252\248\229 \247\229\236 0. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \224\235\242\224\240\252")
		--SystemNotice(role ,"����� ��������� ������ ��� 0. ���������� ������� ������")
		--SystemNotice(role ,"Cursed points higher than 9. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \239\240\229\228\236\229\242")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ �������")
		--SystemNotice(role ,"Insufficient inventory space. Unable to use item")
		UseItemFailed ( role )
		return
	end
	local sta = GetItemAttr( Item ,ITEMATTR_VAL_STA )
	if sta == 0 then
		SystemNotice(role ,"Not yet put in target item. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \224\235\242\224\240\252.")
		--SystemNotice(role ,"Not yet put in target item. ���������� ������� ������.")
		--SystemNotice(role ,"Not yet put in target item, use item failed.")
		UseItemFailed ( role )
		return
	end
	local cha_name = GetChaDefaultName ( role ) 
	if sta == 1 then
		if Elf_EXP == 0 then
		GiveItem ( role , 0 , 7793  , 1 , 20  )  		
		end
		if Elf_EXP == 1 then
		GiveItem ( role , 0 , 7793  , 1 , 19  )  		
		end
		if Elf_EXP == 2 then
		GiveItem ( role , 0 , 7793  , 1 , 18  )  		
		end
		if Elf_EXP == 3 then
		GiveItem ( role , 0 , 7793  , 1 , 17  )  		
		end
		if Elf_EXP == 4 then
		GiveItem ( role , 0 , 7793  , 1 , 16  )  		
		end
		if Elf_EXP == 5 then
		GiveItem ( role , 0 , 7793  , 1 , 15  )  		
		end
		if Elf_EXP == 6 then
		GiveItem ( role , 0 , 7793  , 1 , 14  )  		
		end
		if Elf_EXP == 7 then
		GiveItem ( role , 0 , 7793  , 1 , 13  )  		
		end
		if Elf_EXP == 8 then
		GiveItem ( role , 0 , 7793  , 1 , 12  )  		
		end
		if Elf_EXP == 9 then
		GiveItem ( role , 0 , 7793  , 1 , 12  )  		
		end
		local message ="\192\235\242\224\240\252 \209\242\240\224\230\224 \225\251\235 \240\224\241\239\229\247\224\242\224\237.\200\227\240\238\234 ".. cha_name.." \239\238\235\243\247\232\235 \196\238\241\239\229\245 \209\242\240\224\230\224" 
		--local message ="������ ������ ������ ��� ����������! ".. cha_name.." ������� ���� ������� �������!"
		--local message ="Black Dragon Altar has been unsealed! ".. cha_name.." obtains Black Dragon Torso!"		
		Notice ( message )
		LG("HeiLongJiTan","\200\236\255 \239\229\240\241\238\237\224\230\224",cha_name," \207\240\238\234\235\255\242\251\245 \239\243\237\234\242\238\226",Elf_EXP," \207\238\241\235\229 \238\242\234\240\251\242\232\255 \192\235\242\224\240\255 \215\229\240\237\238\227\238 \196\240\224\234\238\237\224 \194\251 \239\238\235\243\247\232\235\232 \210\240\243\239 \247\229\240\237\238\227\238 \228\240\224\234\238\237\224")
		--LG("HeiLongJiTan","��� ���������",cha_name," ��������� �������",Elf_EXP," ����� �������� ������ ������� ������� �� �������� ���� ������� �������")
		--LG("HeiLongJiTan","Character name as",cha_name,"'s Cursed points is now",Elf_EXP," Under this situation, you open the Black Dragon Altar and obtain Black Dragon Torso")
	end
	if sta == 2 then
		if Elf_EXP == 0 then
		GiveItem ( role , 0 , 7795  , 1 , 20  )  		
		end
		if Elf_EXP == 1 then
		GiveItem ( role , 0 , 7795  , 1 , 19  )  		
		end
		if Elf_EXP == 2 then
		GiveItem ( role , 0 , 7795  , 1 , 18  )  		
		end
		if Elf_EXP == 3 then
		GiveItem ( role , 0 , 7795  , 1 , 17  )  		
		end
		if Elf_EXP == 4 then
		GiveItem ( role , 0 , 7795  , 1 , 16  )  		
		end
		if Elf_EXP == 5 then
		GiveItem ( role , 0 , 7795  , 1 , 15  )  		
		end
		if Elf_EXP == 6 then
		GiveItem ( role , 0 , 7795  , 1 , 14  )  		
		end
		if Elf_EXP == 7 then
		GiveItem ( role , 0 , 7795  , 1 , 13  )  		
		end
		if Elf_EXP == 8 then
		GiveItem ( role , 0 , 7795  , 1 , 12  )  		
		end
		if Elf_EXP == 9 then
		GiveItem ( role , 0 , 7795  , 1 , 2  )  		
		end
		--local message ="\192\235\242\224\240\252 \209\242\240\224\230\224 \225\251\235 \240\224\241\239\229\247\224\242\224\237.\200\227\240\238\234 ".. cha_name.." \239\238\235\243\247\232\235 \193\238\242\232\237\234\232 \209\242\240\224\230\224"  
		--local message ="������ ������ ������ ��� ����������! ".. cha_name.."������� ����� ������� �������!" 
		--local message ="Black Dragon Altar has been unsealed! ".. cha_name.."obtained Black Dragon Wings!" 
		Notice ( message )
		LG("HeiLongJiTan","\200\236\255 \239\229\240\241\238\237\224\230\224",cha_name," \207\240\238\234\235\255\242\251\245 \239\243\237\234\242\238\226",Elf_EXP," \207\238\241\235\229 \238\242\234\240\251\242\232\255 \192\235\242\224\240\255 \215\229\240\237\238\227\238 \196\240\224\234\238\237\224 \194\251 \239\238\235\243\247\232\235\232 \202\240\251\235\238 \215\229\240\237\238\227\238 \228\240\224\234\238\237\224")
		--LG("HeiLongJiTan","��� ���������",cha_name," ��������� �������",Elf_EXP," ����� �������� ������ ������� ������� �� �������� ����� ������� �������")
		--LG("HeiLongJiTan","Character name as",cha_name,"'s Cursed points is now",Elf_EXP,"Under this situation, you opened Black Dragon Altar and obtain Black Dragon Wings")
	end
	if sta == 3 then
		if Elf_EXP == 0 then
		GiveItem ( role , 0 , 7794  , 1 , 20  )  		
		end
		if Elf_EXP == 1 then
		GiveItem ( role , 0 , 7794  , 1 , 19  )  		
		end
		if Elf_EXP == 2 then
		GiveItem ( role , 0 , 7794  , 1 , 18  )  		
		end
		if Elf_EXP == 3 then
		GiveItem ( role , 0 , 7794  , 1 , 17  )  		
		end
		if Elf_EXP == 4 then
		GiveItem ( role , 0 , 7794  , 1 , 16  )  		
		end
		if Elf_EXP == 5 then
		GiveItem ( role , 0 , 7794  , 1 , 15  )  		
		end
		if Elf_EXP == 6 then
		GiveItem ( role , 0 , 7794  , 1 , 14  )  		
		end
		if Elf_EXP == 7 then
		GiveItem ( role , 0 , 7794  , 1 , 13  )  		
		end
		if Elf_EXP == 8 then
		GiveItem ( role , 0 , 7794  , 1 , 12  )  		
		end
		if Elf_EXP == 9 then
		GiveItem ( role , 0 , 7794  , 1 , 2  )  		
		end
		--local message ="\192\235\242\224\240\252 \209\242\240\224\230\224 \225\251\235 \240\224\241\239\229\247\224\242\224\237.\200\227\240\238\234 ".. cha_name.." \239\238\235\243\247\232\235 \207\229\240\247\224\242\234\232 \209\242\240\224\230\224"  
		--local message ="������ ������ ������ ��� ����������! ".. cha_name.." ������� ������ ������� �������!" 
		--local message ="Black Dragon Altar has been unsealed! ".. cha_name.." obtains Black Dragon Claw!" 
		Notice ( message )
		LG("HeiLongJiTan","\200\236\255 \239\229\240\241\238\237\224\230\224",cha_name," \207\240\238\234\235\255\242\251\245 \239\243\237\234\242\238\226",Elf_EXP," \207\238\241\235\229 \238\242\234\240\251\242\232\255 \192\235\242\224\240\255 \215\229\240\237\238\227\238 \196\240\224\234\238\237\224 \194\251 \239\238\235\243\247\232\235\232 \202\238\227\238\242\252 \215\229\240\237\238\227\238 \228\240\224\234\238\237\224")
		--LG("HeiLongJiTan","��� ���������",cha_name," ��������� �������",Elf_EXP," ����� �������� ������ ������� ������� �� �������� ������ ������� �������")
		--LG("HeiLongJiTan","Character name as",cha_name,"'s Cursed points is now",Elf_EXP,"Under this situation, you open Black Dragon Altar and obtain Black Dragon Claw")
	end
	if sta == 4 then
		if Elf_EXP == 0 then
		GiveItem ( role , 0 , 3643  , 1 , 20  )  		
		end
		if Elf_EXP == 1 then
		GiveItem ( role , 0 , 3643  , 1 , 19  )  		
		end
		if Elf_EXP == 2 then
		GiveItem ( role , 0 , 3643  , 1 , 18  )  		
		end
		if Elf_EXP == 3 then
		GiveItem ( role , 0 , 3643  , 1 , 17  )  		
		end
		if Elf_EXP == 4 then
		GiveItem ( role , 0 , 3643  , 1 , 16  )  		
		end
		if Elf_EXP == 5 then
		GiveItem ( role , 0 , 3643  , 1 , 15  )  		
		end
		if Elf_EXP == 6 then
		GiveItem ( role , 0 , 3643  , 1 , 14  )  		
		end
		if Elf_EXP == 7 then
		GiveItem ( role , 0 , 3643  , 1 , 13  )  		
		end
		if Elf_EXP == 8 then
		GiveItem ( role , 0 , 3643  , 1 , 12  )  		
		end
		if Elf_EXP == 9 then
		GiveItem ( role , 0 , 3643  , 1 , 2  )  		
		end
		--local message ="\192\235\242\224\240\252 \209\242\240\224\230\224 \225\251\235 \240\224\241\239\229\247\224\242\224\237.\200\227\240\238\234 ".. cha_name.." \239\238\235\243\247\232\235 \216\235\229\236 \209\242\240\224\230\224"  
		--local message ="������ ������ ������ ��� ����������! ".. cha_name.." ������� ���� ������� �������!"
		--local message ="Black Dragon Altar has been unsealed! ".. cha_name.." obtains Black Dragon Helm!"
		Notice ( message )
		LG("HeiLongJiTan","\200\236\255 \239\229\240\241\238\237\224\230\224",cha_name," \207\240\238\234\235\255\242\251\245 \239\243\237\234\242\238\226",Elf_EXP," \207\238\241\235\229 \238\242\234\240\251\242\232\255 \192\235\242\224\240\255 \215\229\240\237\238\227\238 \196\240\224\234\238\237\224 \194\251 \239\238\235\243\247\232\235\232 \216\235\229\236 \247\229\240\237\238\227\238 \228\240\224\234\238\237\224")
		--LG("HeiLongJiTan","��� ���������",cha_name," ��������� �������",Elf_EXP," ����� �������� ������ ������� ������� �� �������� ���� ������� �������")
		--LG("HeiLongJiTan","Character name as",cha_name,"'s Cursed points is now",Elf_EXP,"Under this situation, you open the Black Dragon Altar and obtain Black Dragon Helm")
	end
	if Elf_EXP ~=0 then
		SystemNotice(role ,"\206\241\242\224\226\248\232\229\241\255 \238\247\234\232 \239\240\238\234\235\255\242\232\233 \231\224\236\229\242\237\238 \241\237\232\231\232\235\232 \234\224\247\229\241\242\226\238 \209\237\224\240\255\230\229\237\232\255 \215\229\240\237\238\227\238 \196\240\224\234\238\237\224")
		--SystemNotice(role ,"���������� ���� ��������� ������� ������� �������� ���������� ������� �������")
		--SystemNotice(role ,"Remaining Cursed points has damage the quality of Black Dragon equipment")
	end
end

--���� ������� �������\���� ������� �������\������ ������� ������� (ID 0864\0865\0866)
function ItemUse_hexin ( role , Item , Item_Traget ) 
	local Item_Traget_ID = GetItemID ( Item_Traget )
	local Item_ID = GetItemID ( Item )		
	local sta = GetItemAttr( Item_Traget ,ITEMATTR_VAL_STA )
	if Item_Traget_ID ~= 266 then
		SystemNotice(role ,"\194\251 \232\241\239\238\235\252\231\238\226\224\235\232 \202\224\236\229\237\252 \209\232\235\251 \234\224\234 \230\229\240\242\226\229\237\237\251\233 \239\240\229\228\236\229\242 ")
		--SystemNotice(role ,"����������, ��������� ���������� ������� �� ������")
		--SystemNotice(role ,"Please place the sacrificial item on the altar")
		UseItemFailed ( role )
		return
	end
	if sta==1 and Item_ID == 510 then
		SystemNotice(role ,"\202\224\236\229\237\252 \209\232\235\251 \232 \242\224\234 \243\230\229 \235\229\230\232\242 \226 \192\235\242\224\240\229 ")
		--SystemNotice(role ,"������ ���� � ��� ��� ����� � ������")
		--SystemNotice(role ,"You have used a Heart of Black Dragon as a sacrificial item")
		UseItemFailed ( role )
		return	
	end
	if sta==2 and Item_ID == 506 then
		SystemNotice(role ,"\202\224\236\229\237\252 \203\238\226\234\238\241\242\232 \232 \242\224\234 \243\230\229 \235\229\230\232\242 \226 \192\235\242\224\240\229 ")
		--SystemNotice(role ,"������ �������� � ��� ��� ����� � ������")
		--SystemNotice(role ,"You have used Soul of Black Dragon as a sacrificial item")
		UseItemFailed ( role )
		return	
	end
	if sta==3 and Item_ID == 508 then
		SystemNotice(role ,"\202\224\236\229\237\252 \210\238\247\237\238\241\242\232 \232 \242\224\234 \243\230\229 \235\229\230\232\242 \226 \192\235\242\224\240\229 ")
		--SystemNotice(role ,"������ �������� � ��� ��� ����� � ������")
		--SystemNotice(role ,"You have used Eye of Black Dragon as a sacrificial item")
		UseItemFailed ( role )
		return	
	end
	if sta==4 and Item_ID == 509 then
		SystemNotice(role ,"\202\224\236\229\237\252 \211\236\224 \232 \242\224\234 \243\230\229 \235\229\230\232\242 \226 \192\235\242\224\240\229 ")
		--SystemNotice(role ,"������ ��� � ��� ��� ����� � ������")
		--SystemNotice(role ,"You have used Eye of Black Dragon as a sacrificial item")
		UseItemFailed ( role )
		return	
	end
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type = GetItemType ( Item )
		local Item_Traget_Type = GetItemType ( Item_Traget )
		local cha_name = GetChaDefaultName ( role ) 
		if Item_type == 66 and Item_Traget_Type == 65 then
				if Item_ID == 510 then
				sta =1
				SystemNotice( role , "\194\251 \239\238\236\229\241\242\232\235\232 \234\224\236\229\237\252 \209\232\235\251 \237\224 \192\235\242\224\240\252 " )
				--SystemNotice( role , "�� ��������� ������ ���� �� ������" )
				--SystemNotice( role , "Use Heart of Black Dragon as a sacrificial item and obtain Black Dragon Torso" )
				LG("HeiLongJiTan_HeXin","Character name as",cha_name,"player used Heart of Black Dragon as sacrificial item")
				elseif Item_ID == 506 then
				sta =2
				SystemNotice( role , "\194\251 \239\238\236\229\241\242\232\235\232 \234\224\236\229\237\252 \203\238\226\234\238\241\242\232 \237\224 \192\235\242\224\240\252 " )
				--SystemNotice( role , "�� ��������� ������ �������� �� ������" )
				--SystemNotice( role , "Use Soul of Black Dragon as a sacrificial item and obtain Black Dragon Wings" )
				LG("HeiLongJiTan_HeXin","Character name as",cha_name,"player used Soul of Black Dragon as a sacrificial item")
				elseif Item_ID == 508 then
				sta =3
				SystemNotice( role , "\194\251 \239\238\236\229\241\242\232\235\232 \234\224\236\229\237\252 \210\238\247\237\238\241\242\232 \237\224 \192\235\242\224\240\252 " )
				--SystemNotice( role , "�� ��������� ������ �������� �� ������" )
				--SystemNotice( role , "Use Eye of Black Dragon as a sacrificial item to obtain Black Dragon Claw" )
				LG("HeiLongJiTan_HeXin","Character name as",cha_name,"player used Eye of Black Dragon as a sacrificial item")
				elseif Item_ID == 509 then
				sta =4
				SystemNotice( role , "\194\251 \239\238\236\229\241\242\232\235\232 \234\224\236\229\237\252 \211\236\224 \237\224 \192\235\242\224\240\252 " )
				else 
						UseItemFailed ( role )
						return
				end
				SetItemAttr( Item_Traget ,ITEMATTR_VAL_STA ,sta )
		end 
end

--����������� ���� (ID 0267)
function ItemUse_HZLi ( role , Item , Item_Traget ) 
	local Item_ID = GetItemID ( Item_Traget )
	if Item_ID ~= 266 then
		SystemNotice(role ,"\207\238\230\224\235\243\233\241\242\224, \239\238\236\229\241\242\232\242\229 \206\227\237\229\242\226\238\240\237\243\254 \241\232\235\243 \237\224 \224\235\242\224\240\252")
		--SystemNotice(role ,"����������, ��������� ����������� ���� �� ������")
		--SystemNotice(role ,"Please place the Power of Flame on the altar")
		UseItemFailed ( role )
		return
	end
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type = GetItemType ( Item )
		local Item_Traget_Type = GetItemType ( Item_Traget )
		if Item_type == 66 and Item_Traget_Type == 65  then
				local str = GetItemAttr( Item_Traget ,ITEMATTR_VAL_STR )
				if str >= 5 then
					UseItemFailed ( role )
				return
				end
				local rad = math.random ( 1, 100 )
				 if rad<=50 then
					local Elf_URE = GetItemAttr(Item_Traget,ITEMATTR_URE)
					str = str + 1
					if Elf_URE >= 50 then
					Elf_URE = Elf_URE-50
					end
					SetItemAttr( Item_Traget ,ITEMATTR_VAL_STR ,str )
					SetItemAttr( Item_Traget ,ITEMATTR_URE ,Elf_URE )
				else 
				local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
				local Elf_EXP = GetItemAttr(Item_Traget,ITEMATTR_ENERGY)
					Elf_MaxEXP = Elf_MaxEXP + 1
					Elf_EXP = Elf_EXP + 1
					SystemNotice( role , "\202 \241\238\230\224\235\229\237\232\254,\192\235\242\224\240\252 \209\242\240\224\230\224 \225\251\235 \239\240\238\234\235\255\242!" ) 
					--SystemNotice( role , "� ���������,������ ��� �������." )
					--SystemNotice( role , "Unfortunately, the Altar has been cursed by the soul of the black dragon" )
					SetItemAttr( Item_Traget ,ITEMATTR_MAXENERGY ,Elf_MaxEXP )
					SetItemAttr( Item_Traget ,ITEMATTR_ENERGY ,Elf_EXP )
				end 
		end 
end

--���� ������ (ID 0270)
function ItemUse_BZLi ( role , Item , Item_Traget ) 
	local Item_ID = GetItemID ( Item_Traget )
	if Item_ID ~= 266 then
		SystemNotice(role ,"\207\238\230\224\235\243\233\241\242\224, \239\238\236\229\241\242\232\242\229 \209\232\235\243 \204\238\240\238\231\224 \237\224 \224\235\242\224\240\252")
		--SystemNotice(role ,"����������, ��������� ���� ������ �� ������")
		--SystemNotice(role ,"Place Power of Frost on the altar")
		UseItemFailed ( role )
		return
	end
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type = GetItemType ( Item )
		local Item_Traget_Type = GetItemType ( Item_Traget )
		if Item_type == 66 and Item_Traget_Type == 65 then
				local con = GetItemAttr( Item_Traget ,ITEMATTR_VAL_CON )
				if con >= 5 then
					UseItemFailed ( role )
				return
				end
				local rad = math.random ( 1, 100 )
				 if rad<=50 then
					local Elf_URE = GetItemAttr(Item_Traget,ITEMATTR_URE)
					con = con + 1
					if Elf_URE >= 50 then
					Elf_URE = Elf_URE-50
					end
					SetItemAttr( Item_Traget ,ITEMATTR_VAL_CON ,con )
					SetItemAttr( Item_Traget ,ITEMATTR_URE ,Elf_URE )
				else 
				local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
				local Elf_EXP = GetItemAttr(Item_Traget,ITEMATTR_ENERGY)
					Elf_MaxEXP = Elf_MaxEXP + 1
					Elf_EXP = Elf_EXP + 1
					SystemNotice( role , "\202 \241\238\230\224\235\229\237\232\254,\192\235\242\224\240\252 \209\242\240\224\230\224 \225\251\235 \239\240\238\234\235\255\242!" ) 
					--SystemNotice( role , "� ���������,������ ��� �������." )
					--SystemNotice( role , "Unfortunately, the Altar has been cursed by the soul of the black dragon" )
					SetItemAttr( Item_Traget ,ITEMATTR_MAXENERGY ,Elf_MaxEXP )
					SetItemAttr( Item_Traget ,ITEMATTR_ENERGY ,Elf_EXP )
				end 
		end 
end

--���� ����� (ID 0268)
function ItemUse_FZLi( role , Item , Item_Traget ) 
	local Item_ID = GetItemID ( Item_Traget )
	if Item_ID ~= 266 then
		SystemNotice(role ,"\207\238\230\224\235\243\233\241\242\224, \239\238\236\229\241\242\232\242\229 \204\238\249\252 \226\229\242\240\224 \237\224 \224\235\242\224\240\252")
		--SystemNotice(role ,"����������, ��������� ���� ����� �� ������")
		--SystemNotice(role ,"Please place the Power of Wind on the altar")
		UseItemFailed ( role )
		return
	end
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )  
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type = GetItemType ( Item )
		local Item_Traget_Type = GetItemType ( Item_Traget )
		if Item_type == 66 and Item_Traget_Type == 65 then
				local agi = GetItemAttr( Item_Traget ,ITEMATTR_VAL_AGI )
					if agi >= 5 then
					UseItemFailed ( role )
					return
					end
				local rad = math.random ( 1, 100 )
				 if rad<=50 then
					local Elf_URE = GetItemAttr(Item_Traget,ITEMATTR_URE)
					agi = agi + 1
					if Elf_URE >= 50 then
					Elf_URE = Elf_URE-50
					end
					SetItemAttr( Item_Traget ,ITEMATTR_VAL_AGI ,agi )
					SetItemAttr( Item_Traget ,ITEMATTR_URE ,Elf_URE )
				else 
				local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
				local Elf_EXP = GetItemAttr(Item_Traget,ITEMATTR_ENERGY)
					Elf_MaxEXP = Elf_MaxEXP + 1
					Elf_EXP = Elf_EXP + 1
					SystemNotice( role , "\202 \241\238\230\224\235\229\237\232\254,\192\235\242\224\240\252 \209\242\240\224\230\224 \225\251\235 \239\240\238\234\235\255\242!" ) 
					--SystemNotice( role , "� ���������,������ ��� �������." )
					--SystemNotice( role , "Unfortunately, the Altar has been cursed by the soul of the black dragon" )
					SetItemAttr( Item_Traget ,ITEMATTR_MAXENERGY ,Elf_MaxEXP )
					SetItemAttr( Item_Traget ,ITEMATTR_ENERGY ,Elf_EXP )
				end 
		end 
end

--���� ����� (ID 0269)
function ItemUse_LZli ( role , Item , Item_Traget ) 
	local Item_ID = GetItemID ( Item_Traget )
	if Item_ID ~= 266 then
		SystemNotice(role ,"\207\238\230\224\235\243\233\241\242\224, \239\238\236\229\241\242\232\242\229 \209\232\235\243 \227\240\238\236\224 \237\224 \224\235\242\224\240\252")
		--SystemNotice(role ,"����������, ��������� ���� ����� �� ������")
		--SystemNotice(role ,"Please place Power of Thunder on the altar")
		UseItemFailed ( role )
		return
	end
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type = GetItemType ( Item )
		local Item_Traget_Type = GetItemType ( Item_Traget )
		if Item_type == 66 and Item_Traget_Type == 65 then
				local dex = GetItemAttr( Item_Traget ,ITEMATTR_VAL_DEX )
					if dex >= 5 then
					UseItemFailed ( role )
					return
					end
				local rad = math.random ( 1, 100 )
				 if rad<=50 then
					local Elf_URE = GetItemAttr(Item_Traget,ITEMATTR_URE)
					dex = dex + 1
					if Elf_URE >= 50 then
					Elf_URE = Elf_URE-50
					end
					SetItemAttr( Item_Traget ,ITEMATTR_VAL_DEX ,dex )
					SetItemAttr( Item_Traget ,ITEMATTR_URE ,Elf_URE )
				else 
				local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
				local Elf_EXP = GetItemAttr(Item_Traget,ITEMATTR_ENERGY)
					Elf_MaxEXP = Elf_MaxEXP + 1
					Elf_EXP = Elf_EXP + 1
					SystemNotice( role , "\202 \241\238\230\224\235\229\237\232\254,\192\235\242\224\240\252 \209\242\240\224\230\224 \225\251\235 \239\240\238\234\235\255\242!" ) 
					--SystemNotice( role , "� ���������, ������ ��� ������� ����� ������� �������." )
					--SystemNotice( role , "Unfortunately, the Altar has been cursed by the soul of the black dragon" )
					SetItemAttr( Item_Traget ,ITEMATTR_MAXENERGY ,Elf_MaxEXP )
					SetItemAttr( Item_Traget ,ITEMATTR_ENERGY ,Elf_EXP )
				end 
		end 
end

--���������� ����� (ID 0271)
function ItemUse_ZhuFu ( role , Item , Item_Traget ) 
	local Item_ID = GetItemID ( Item_Traget )
	if Item_ID ~= 266 then
		SystemNotice(role ,"\207\238\230\224\235\243\233\241\242\224 \239\238\228\242\226\229\240\228\232\242\229 \232\241\239\238\235\252\231\238\226\224\237\232\229 \192\237\227\229\235\252\241\234\232\245 \202\238\241\242\229\233")
		--SystemNotice(role ,"���������� ����������� ������������� ���������� ������")
		--SystemNotice(role ,"Please confirm to use Angelic Dice")
		UseItemFailed ( role )
		return
	end
	local Elf_EXP = GetItemAttr(Item_Traget,ITEMATTR_ENERGY)
	local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)

	if Elf_EXP == 0 then
		UseItemFailed ( role )
		return
	end
	local rad = math.random ( 1, 100 )

	if Elf_EXP <= 5 and Elf_EXP >= 1 then
		if rad <= 50 then
			Elf_EXP = Elf_EXP -1
		else
			SystemNotice(role ,"\202\238\241\242\232 \209\242\240\224\230\224, \234\238\242\238\240\251\229 \226\251 \232\241\239\238\235\252\231\238\226\224\235\232, \232\236\229\235\232 \239\235\238\245\238\229 \234\224\247\229\241\242\226\238, \239\240\238\234\235\255\242\232\229 \237\229 \225\251\235\238 \241\237\255\242\238! ")
			--SystemNotice(role ,"���������� �����, ������� �� ������������, ����� ������ ��������, ��������� �� ���� �����.")
			--SystemNotice(role ,"The angelic dice you used was of bad quality, the curse was not lifted.")
		end
	end

	if Elf_EXP <= 10 and Elf_EXP >= 6 then
		if rad <= 50 then
			Elf_EXP = Elf_EXP -1
		else
			SystemNotice(role ,"\192\237\227\229\235\252\241\234\232\229 \234\238\241\242\232, \234\238\242\238\240\251\229 \194\251 \232\241\239\238\235\252\231\238\226\224\235\232, \232\236\229\235\232 \239\235\238\245\238\229 \234\224\247\229\241\242\226\238, \239\240\238\234\235\255\242\232\229 \237\229 \225\251\235\238 \241\237\255\242\238.")
			--SystemNotice(role ,"���������� �����, ������� �� ������������, ����� ������ ��������, ��������� �� ���� �����.")
			--SystemNotice(role ,"The angelic dice you used was of bad quality, the curse was not lifted.")
		end
	end

	if Elf_EXP <= 15 and Elf_EXP >= 11 then
		if rad <= 50 then
			Elf_EXP = Elf_EXP -1
		else
			SystemNotice(role ,"\192\237\227\229\235\252\241\234\232\229 \234\238\241\242\232, \234\238\242\238\240\251\229 \194\251 \232\241\239\238\235\252\231\238\226\224\235\232, \232\236\229\235\232 \239\235\238\245\238\229 \234\224\247\229\241\242\226\238, \239\240\238\234\235\255\242\232\229 \237\229 \225\251\235\238 \241\237\255\242\238.")
			--SystemNotice(role ,"���������� �����, ������� �� ������������, ����� ������ ��������, ��������� �� ���� �����.")
			--SystemNotice(role ,"The angelic dice you used was of bad quality, the curse was not lifted.")
		end
	end

	if Elf_EXP >= 16  then
		Elf_EXP = Elf_EXP -1
	end

	SetItemAttr( Item_Traget ,ITEMATTR_ENERGY ,Elf_EXP )
	SetItemAttr( Item_Traget ,ITEMATTR_MAXENERGY ,Elf_EXP )
end

--------------------------------------------------------------------------------------------------
--�������\����-���
--------------------------------------------------------------------------------------------------

--������� � ������� �������� (ID 1094)
function ItemUse_YiYuanHaoYunBOX ( role , Item )
	local Percentage = Percentage_Random ( 0.1 )
			if Percentage == 1 then
				 AddMoney ( role , 0 , 50000 )
			else	
				local item_type = BoxXiang_YiYuanBOX
				local item_type_rad = BoxXiang_YiYuanBOX_Rad 
				local item_type_count = BoxXiang_YiYuanBOX_Count 
				local maxitem = BoxXiang_YiYuanBOX_Mxcount
				local item_quality = BoxXiang_YiYuanBOX_Qua
				local General = 0  
				local ItemId = 0 
			--	local Item_CanGet = GetChaFreeBagGridNum ( role )
				
			--	if Item_CanGet <= 1 then
			--		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \207\238\241\251\235\234\243 \241 \243\228\224\247\237\251\236 \239\238\228\224\240\234\238\236")
			--		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������� � ������� ��������")
			--		--SystemNotice(role ,"Insufficient space in inventory. Unable to use Prosperous Packet")
			--		UseItemFailed ( role )
			--		return
			--	end
				for i = 1 , maxitem , 1 do 
					General = item_type_rad [ i ] + General		
				end 
				local a = math.random ( 1, General )
				local b = 0
				local d = 0 
				local c = -1
				for k = 1 , maxitem , 1 do

					d = item_type_rad [ k ] + b

					 if a <= d and a > b then
						c = k
						break		
					end 
					b = d 
				end 
				if c == -1 then 
					ItemId = 3124 
				else 
					ItemId = item_type [c]  
					ItemCount = item_type_count [c] 
				end 

				GiveItem ( role , 0 , ItemId , ItemCount , item_quality )
		
				local GoodItem = {}
				GoodItem[0] = 3336
				GoodItem[1] = 3885
				GoodItem[2] = 430
				GoodItem[3] = 3886
				GoodItem[4] = 3113
				GoodItem[5] = 3111
				GoodItem[6] = 3093
				GoodItem[7] = 3090
				GoodItem[8] =0860
				GoodItem[9] =0861
				GoodItem[10] =0862
				GoodItem[11] =0863
				GoodItem[12] =179
				GoodItem[13] =3084
				GoodItem[14] =3085


				local Good_C = 0
				for Good_C = 0 , 14 , 1 do
					if ItemId == GoodItem[Good_C] then
						local itemname = GetItemName ( ItemId ) 
						local cha_name = GetChaDefaultName ( role ) 
						local message = cha_name.." \238\242\234\240\251\226\224\229\242 \207\238\241\251\235\234\243 \241 \243\228\224\247\237\251\236 \239\238\228\224\240\234\238\236 \232 \239\238\235\243\247\224\229\242"..itemname  
						--local message = cha_name.." ��������� ������� � ������� �������� � ��������"..itemname 
						--local message = cha_name.." opens a Lucky Packet and obtain"..itemname 
						Notice ( message )
					end
				end
			end 
	end

--����-��� (ID 0272)
function ItemUse_tedengjiang ( role , Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\251\245 \241\235\238\242\238\226 \226 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 845  , 1 , 16  )  
	GiveItem ( role , 0 , 846  , 1 , 16  )  
	GiveItem ( role , 0 , 847  , 1 , 16  ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \195\240\224\237-\239\240\232 \232 \239\238\235\243\247\224\229\242 \209\237\224\240\255\230\229\237\232\229 \215\229\240\237\238\227\238 \196\240\224\234\238\237\224"
	--local message = cha_name.." ��������� ����-��� � �������� ���������� ������� �������"
	--local message = cha_name.." opens the Grand Prize and obtain Black Dragon set"
		Notice ( message )
end

--������ ���� ID 0273)
function ItemUse_yidengjiang ( role , Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\251\245 \241\235\238\242\238\226 \226 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0853  , 1 , 4 ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \207\229\240\226\251\233 \239\240\232\231 \232 \239\238\235\243\247\224\229\242 \198\243\240\237\224\235 \241\247\224\241\242\235\232\226\251\233 \238\242\228\251\245" 
	--local message = cha_name.." ��������� ������ ���� � �������� ������ ���������� �����"
	--local message = cha_name.." opens the First Prize and obtain a Happy Holiday Magazine"
		Notice ( message )
end

--������ ���� (ID 0274)
function ItemUse_erdengjiang ( role , Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 14 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\251\245 \241\235\238\242\238\226 \226 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	local rad = math.random ( 1, 4 )
	if rad == 1 then
	GiveItem ( role , 0 , 5013  , 1 , 4 ) 
	GiveItem ( role , 0 , 5021  , 1 , 4 ) 
	GiveItem ( role , 0 , 5029  , 1 , 4 ) 
	elseif rad == 2 then
	GiveItem ( role , 0 , 5014  , 1 , 4 ) 
	GiveItem ( role , 0 , 5022  , 1 , 4 ) 
	GiveItem ( role , 0 , 5030  , 1 , 4 ) 
	elseif rad == 3 then
	GiveItem ( role , 0 , 5015  , 1 , 4 ) 
	GiveItem ( role , 0 , 5023  , 1 , 4 ) 
	GiveItem ( role , 0 , 5031  , 1 , 4 ) 
	elseif rad == 4 then
	GiveItem ( role , 0 , 5020  , 1 , 4 ) 
	GiveItem ( role , 0 , 5024  , 1 , 4 ) 
	GiveItem ( role , 0 , 5032  , 1 , 4 ) 
	GiveItem ( role , 0 , 5037  , 1 , 4 ) 
	end
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \194\242\238\240\238\233 \239\240\232\231 \232 \239\238\235\243\247\224\229\242 10 \211\241\232\235\232\226\224\254\249\232\245 \234\240\232\241\242\224\235\235\238\226 \232 1 \237\224\225\238\240 \243\234\240\224\248\229\237\232\233"   
	local message = cha_name.." ��������� ������ ���� ���� ������ ��� � ���� ������" 
	--local message = cha_name.." opens the Second Prize and obtain 10 Strengthening Crystal and 1 set of Apparel" 
		Notice ( message )
end

--���� �� ������ ����� (ID 0275)
function ItemUse_sandengjiang ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\251\245 \241\235\238\242\238\226 \226 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	local rad = math.random ( 1, 2 )
	if rad == 1 then
		GiveItem ( role , 0 , 3094  , 1 , 4 ) 
		GiveItem ( role , 0 , 3096  , 1 , 4 )
	else
		GiveItem ( role , 0 , 1094  , 1 , 4 ) 
	end
end

--������� 99 (ID 1095)
function ItemUse_BaoZhaBOX ( role , Item )
	local item_type = BoxXiang_BaoZhaBOX
	local item_type_rad = BoxXiang_BaoZhaBOX_Rad
	local item_type_count = BoxXiang_BaoZhaBOX_Count
	local maxitem = BoxXiang_baozhabao_Mxcount
	local item_quality = BoxXiang_baozhabao_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
		
	--if Item_CanGet <= 1 then
	--		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \207\238\241\251\235\234\243 99")
	--		--SystemNotice(role ,"������������ ���������� ����� � ���������. ���������� ������� ������� 99")
	--		--SystemNotice(role ,"Insufficient space in inventory. Unable to use Prosperous Packet")
		--UseItemFailed ( role )
		--return
	--end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1	
	for k = 1 , maxitem , 1 do
		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break		
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 

	GiveItem ( role , 0 , ItemId , ItemCount , item_quality )
	local GoodItem = {}
	GoodItem[0] = 3111
	GoodItem[1] = 3110
	GoodItem[2] = 3112
	GoodItem[3] = 3886
	GoodItem[4] = 3093
	GoodItem[5] = 3090
	GoodItem[6] = 430
	GoodItem[7] = 179
	GoodItem[8] =3084
	GoodItem[9] =3085
	GoodItem[10] =0244
	GoodItem[11] =0250
	GoodItem[12] =0253
	GoodItem[13] =0260
	GoodItem[14] =0860
	GoodItem[15] =0861
	GoodItem[16] =0862
	GoodItem[17] =3458
	GoodItem[18] =0247
	GoodItem[19] =0271
	local Good_C = 0
	for Good_C = 0 , 19 , 1 do
		if ItemId == GoodItem[Good_C] then
			local itemname = GetItemName ( ItemId ) 
			local cha_name = GetChaDefaultName ( role ) 
			local message = cha_name.." \238\242\234\240\251\226\224\229\242 \207\238\241\251\235\234\243 99 \232 \239\238\235\243\247\224\229\242 "..itemname  
			--local message = cha_name.." ��������� ������� 99 � �������� "..itemname 
			--local message = cha_name.." opens a 99 Parcel and obtain "..itemname 
			Notice ( message )
		end
	end
end

--������ ������������ (ID 0240)
function ItemUse_wxlh( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <1 then
		SystemNotice(role ,"\210\240\229\225\243\229\242\241\255 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \194\224\248\229\236 \232\237\226\229\237\242\224\240\229, \247\242\238\225\251 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"��������� 1 ��������� ���� � ����� ���������, ����� ������� ������")
		--SystemNotice(role ,"To open a Chest requires 1 empty slot")
		UseItemFailed ( role )
		return
	end
	local r1,r2 =MakeItem ( role , SI  , SN , SE )
	local Item_star = GetChaItem ( role , 2 , r2 )
	local num={}
	local numAttr={}
	local b = 0
	local a = {}
	for b=1,5,1 do
		num [b]=0
		numAttr [b]=0
	end
	b = 0
	for i=1,47,1 do
	    a [i]=GetItemAttr ( Item_star , i )
		if a [i]~=0 then
	--		SystemNotice( role , a [i] )
				b = b + 1
				num [b]=i
				numAttr [b]=a[i]
		end
	end
	SetItemAttr ( Item_star ,num [1] , SA1 )
	SetItemAttr ( Item_star ,num [2] , SA2 )
	SetItemAttr ( Item_star ,num [3] , SA3 )
	SetItemAttr ( Item_star ,num [4] , SA4)
	SetItemAttr ( Item_star ,num [5] , SA5)

end

--------------------------------------------------------------------------------------------------
--�������� �� ���������� ������
--------------------------------------------------------------------------------------------------

--�������� �� ���������� ������ ID 0580)
function ItemUse_Sjz( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 5 then
		SystemNotice(role ,"\215\242\238\225\251 \232\241\239\238\235\252\231\238\226\224\242\252 \208\224\241\239\232\241\234\243 \237\224 \243\237\232\234\224\235\252\237\238\229 \234\238\235\252\246\238 \239\238 \234\240\224\233\237\229\233 \236\229\240\229 \242\240\229\225\243\229\242\241\255 5 \241\226\238\225\238\228\237\251\245 \241\235\238\242\238\226 \226 \194\224\248\229\236 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"����� ������������ �������� �� ���������� ������ �� ������� ���� ��������� 5 ��������� ������ � ����� ���������")
		--SystemNotice(role ,"Inventory requires at least 5 empty slots to use Unique Ring Voucher")
		UseItemFailed ( role )
		return
	end
	local rad = math.random ( 1, 5 )
	if rad ==1 then
	GiveItem ( role , 0 , 281  , 1 , 4 )	
	GiveItem ( role , 0 , 286  , 1 , 4 )	
	GiveItem ( role , 0 , 324  , 1 , 4 )	
	GiveItem ( role , 0 , 334  , 1 , 4 )	
	GiveItem ( role , 0 , 387  , 1 , 4 )	
	end
	if rad ==2 then
	GiveItem ( role , 0 , 282  , 1 , 4 )	
	GiveItem ( role , 0 , 287  , 1 , 4 )	
	GiveItem ( role , 0 , 327  , 1 , 4 )	
	GiveItem ( role , 0 , 346  , 1 , 4 )	
	GiveItem ( role , 0 , 414  , 1 , 4 )		
	end
	if rad ==3 then
	GiveItem ( role , 0 , 283  , 1 , 4 )	
	GiveItem ( role , 0 , 288  , 1 , 4 )	
	GiveItem ( role , 0 , 328  , 1 , 4 )	
	GiveItem ( role , 0 , 347  , 1 , 4 )	
	GiveItem ( role , 0 , 415  , 1 , 4 )	
	end
	if rad ==4 then
	GiveItem ( role , 0 , 284  , 1 , 4 )	
	GiveItem ( role , 0 , 524  , 1 , 4 )	
	GiveItem ( role , 0 , 329  , 1 , 4 )	
	GiveItem ( role , 0 , 348  , 1 , 4 )	
	GiveItem ( role , 0 , 416  , 1 , 4 )		
	end
	if rad ==5 then
	GiveItem ( role , 0 , 285  , 1 , 4 )	
	GiveItem ( role , 0 , 321  , 1 , 4 )	
	GiveItem ( role , 0 , 330  , 1 , 4 )	
	GiveItem ( role , 0 , 349  , 1 , 4 )	
	GiveItem ( role , 0 , 417  , 1 , 4 )			
	end
end

--�������� �� ���������� �������� (ID 0581)
function ItemUse_Sxl( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 5 then
		SystemNotice(role ,"\215\242\238\225\251 \232\241\239\238\235\252\231\238\226\224\242\252 \208\224\241\239\232\241\234\243 \237\224 \243\237\232\234\224\235\252\237\238\229 \238\230\229\240\229\235\252\229 \239\238 \234\240\224\233\237\229\233 \236\229\240\229 \242\240\229\225\243\229\242\241\255 5 \241\226\238\225\238\228\237\251\245 \241\235\238\242\238\226 \226 \194\224\248\229\236 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"����� ������������ �������� �� ���������� �������� �� ������� ���� ��������� 5 ��������� ������ � ����� ���������")
		--SystemNotice(role ,"Inventory requires at least 5 empty slots to use Unique Necklace Voucher")
		UseItemFailed ( role )
		return
	end
	local rad = math.random ( 1, 2 )
	if rad ==1 then
	GiveItem ( role , 0 , 418  , 1 , 4 )	
	GiveItem ( role , 0 , 420  , 1 , 4 )	
	GiveItem ( role , 0 , 739  , 1 , 4 )	
	GiveItem ( role , 0 , 462  , 1 , 4 )	
	GiveItem ( role , 0 , 495  , 1 , 4 )		
	end
	if rad ==2 then
	GiveItem ( role , 0 , 419  , 1 , 4 )	
	GiveItem ( role , 0 , 421  , 1 , 4 )	
	GiveItem ( role , 0 , 461  , 1 , 4 )	
	GiveItem ( role , 0 , 463  , 1 , 4 )	
	GiveItem ( role , 0 , 497  , 1 , 4 )		
	end
end

--�������� �� ���������� ������ (ID 0582)
function ItemUse_Sbk( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 5 then
		SystemNotice(role ,"\215\242\238\225\251 \232\241\239\238\235\252\231\238\226\224\242\252 \208\224\241\239\232\241\234\243 \237\224 \243\237\232\234\224\235\252\237\251\233 \234\238\240\224\235\235 \239\238 \234\240\224\233\237\229\233 \236\229\240\229 \242\240\229\225\243\229\242\241\255 5 \241\226\238\225\238\228\237\251\245 \241\235\238\242\238\226 \226 \194\224\248\229\236 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"����� ������������ �������� �� ���������� ������ �� ������� ���� ��������� 5 ��������� ������ � ����� ���������")
		--SystemNotice(role ,"Inventory requires at least 5 empty slots to use Unique Coral Voucher")
		UseItemFailed ( role )
		return
	end
	local rad = math.random ( 1, 2 )
	if rad ==1 then
	GiveItem ( role , 0 , 498  , 1 , 4 )	
	GiveItem ( role , 0 , 503  , 1 , 4 )	
	GiveItem ( role , 0 , 504  , 1 , 4 )	
	GiveItem ( role , 0 , 505  , 1 , 4 )	
	GiveItem ( role , 0 , 506  , 1 , 4 )		
	end
	if rad ==2 then
	GiveItem ( role , 0 , 508  , 1 , 4 )	
	GiveItem ( role , 0 , 509  , 1 , 4 )	
	GiveItem ( role , 0 , 510  , 1 , 4 )	
	GiveItem ( role , 0 , 522  , 1 , 4 )	
	GiveItem ( role , 0 , 523  , 1 , 4 )		
	end
end

--------------------------------------------------------------------------------------------------
--������
--------------------------------------------------------------------------------------------------

--������� �� ������ ���� (ID 0563)
function Jz_Script_xdfjp(role, Item )
	local i = CheckBagItem(role,563)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,563,1)
			if j == 1 then
				MoveCity(role,"Summer Island")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� �� ������ ����� (ID 0583)
function Jz_Script_qdfjp(role, Item )
	local i = CheckBagItem(role,583)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,583,1)
			if j == 1 then
				MoveCity(role,"Autumn Island")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������������ (ID 0584)
function ItemUse_Crbbt(role, Item )
	local statelv = 1
	local statetime = 20
	AddState( role , role , STATE_CJBBT , statelv , statetime )
end

--�������� ��������� (ID 0585)
function ItemUse_Jrqkl(role, Item )
	local statelv = 1
	local statetime = 20
	AddState( role , role , STATE_JRQKL , statelv , statetime )
end

--��������� ������ (ID 1096)
function ItemUse_ZhouSuiBOX ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 2 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \222\225\232\235\229\233\237\251\233 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ��������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open Birthday Package")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1097 , 1 , 0 )
	local item_type = BoxXiang_ZhousSuiBOX
	local item_type_rad = BoxXiang_ZhousSuiBOX_Rad 
	local item_type_count = BoxXiang_ZhousSuiBOX_Count 
	local maxitem = BoxXiang_ZhouSui_Mxcount
	local item_quality = BoxXiang_ZhouSui_Qua
	local General = 0  
	local ItemId = 0 
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break		
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality )
	if ItemId ==  0853 then
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \222\225\232\235\229\233\237\251\233 \241\243\237\228\243\234 \232 \239\238\235\243\247\224\229\242 \198\243\240\237\224\235 \209\247\224\241\242\235\232\226\251\233 \206\242\228\251\245" 
	--local message = cha_name.." ��������� ��������� ������ � �������� ������ ���������� �����" 
	--local message = cha_name.." opens Anniversary Chest and obtain Happy Holiday Magazine" 
	Notice ( message )
	end
end

--������ ������������ ������� �������� (ID 0854)
function ItemUse_CZHe( role , Item ) 							
 	local Money_add = 1000000
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Have>=1999900000 then
		SystemNotice (role, "\211 \194\224\241 \241\235\232\248\234\238\236 \236\237\238\227\238 \231\238\235\238\242\224. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \239\240\229\228\236\229\242")
		--SystemNotice (role, "� ��� ������� ����� ������. ���������� ������������ �������)
		--SystemNotice (role, "Your account is saturated. Unable to use item")
		UseItemFailed ( role )
		return	
	end
	AddMoney ( role , 0 , Money_add )
end 

function ItemUse_Timgold( role , Item ) 							
 	local Money_add = 10000
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Have>=1999990000 then
		SystemNotice (role, "\211 \194\224\241 \241\235\232\248\234\238\236 \236\237\238\227\238 \231\238\235\238\242\224. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \239\240\229\228\236\229\242")
		--SystemNotice (role, "� ��� ������� ����� ������. ���������� ������������ �������)
		--SystemNotice (role, "Your account is saturated. Unable to use item")
		UseItemFailed ( role )
		return	
	end
	AddMoney ( role , 0 , Money_add )
end 


--------------------------------------------------------------------------------------------------
--���� ��� � ����� � ��������� �����������
--------------------------------------------------------------------------------------------------

--���� ����� (ID 0679)
function ItemUse_MDXZJLD ( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \223\233\246\238 \204\238\240\228\238")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���� �����")
		--SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 680  , 1 , 4 ) 
end

--����� � ��������� ����������� (ID 2445)
function Jz_Script_jialebi(role, Item )
	local i = CheckBagItem(role,2445)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,2445,1)
			if j == 1 then
				MoveCity(role,"Caribbean")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--���� ����� (ID 0571)
function ItemUse_YZJLD( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \223\233\246\238 \211\228\224\247\232")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���� �����")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Egg of Luck")
		UseItemFailed ( role )
		return
	end
	local Num_newJL = GetItemForgeParam ( Item , 1 )
	local Part1_newJL = GetNum_Part1 ( Num_newJL )
	local Part2_newJL = GetNum_Part2 ( Num_newJL )	
	local Part3_newJL = GetNum_Part3 ( Num_newJL )

	local new_str=GetItemAttr ( Item , ITEMATTR_VAL_STR )      
	local new_dex=GetItemAttr( Item , ITEMATTR_VAL_DEX  )	  
	local new_sta=GetItemAttr ( Item , ITEMATTR_VAL_STA  )    
	local new_agi=GetItemAttr( Item , ITEMATTR_VAL_AGI )       
	local new_con=GetItemAttr ( Item , ITEMATTR_VAL_CON )  
	local new_lv = new_str + new_con + new_agi + new_dex + new_sta
	local new_MAXENERGY = 240 * ( new_lv + 1 )
	if new_MAXENERGY > 6480 then
		Item_MAXENERGY = 6480
	end
	local new_MAXURE = 5000 + 1000*new_lv
	if new_MAXURE > 32000 then
		Item_MAXURE_NUM = 32000
	end	  

	local rad = math.random ( 1, 100 )
	if Part3_newJL==3 then
		GiveItem ( role , 0 , 609  , 1 , 4 ) 
	end
	if Part3_newJL==2 then
		if rad <=95 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 95 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	if Part3_newJL==1 then
		if rad <=90 then
			GiveItem ( role , 0 , 239  , 1 , 4 ) 
		elseif rad > 90 and rad <=98 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 98 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	local r1,r2 =MakeItem ( role , 231  , 1 , 4 )
	local Item_newJL = GetChaItem ( role , 2 , r2 )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con ) 
	SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
	SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
end

--���� ������������ (ID 0572)
function ItemUse_TZJLD( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \223\233\246\238 \242\229\235\238\241\235\238\230\229\237\232\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���� ������������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Egg of Constitution")
		UseItemFailed ( role )
		return
	end
	local Num_newJL = GetItemForgeParam ( Item , 1 )
	local Part1_newJL = GetNum_Part1 ( Num_newJL )
	local Part2_newJL = GetNum_Part2 ( Num_newJL )	
	local Part3_newJL = GetNum_Part3 ( Num_newJL )

	local new_str=GetItemAttr ( Item , ITEMATTR_VAL_STR )      
	local new_dex=GetItemAttr( Item , ITEMATTR_VAL_DEX  )	  
	local new_sta=GetItemAttr ( Item , ITEMATTR_VAL_STA  )    
	local new_agi=GetItemAttr( Item , ITEMATTR_VAL_AGI )       
	local new_con=GetItemAttr ( Item , ITEMATTR_VAL_CON )  
	local new_lv = new_str + new_con + new_agi + new_dex + new_sta
	local new_MAXENERGY = 240 * ( new_lv + 1 )
	if new_MAXENERGY > 6480 then
		Item_MAXENERGY = 6480
	end
	local new_MAXURE = 5000 + 1000*new_lv
	if new_MAXURE > 32000 then
		Item_MAXURE_NUM = 32000
	end	  

	local rad = math.random ( 1, 100 )
	if Part3_newJL==3 then
		GiveItem ( role , 0 , 609  , 1 , 4 ) 
	end
	if Part3_newJL==2 then
		if rad <=95 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 95 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	if Part3_newJL==1 then
		if rad <=90 then
			GiveItem ( role , 0 , 239  , 1 , 4 ) 
		elseif rad > 90 and rad <=98 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 98 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	local r1,r2 =MakeItem ( role , 233  , 1 , 4 )
	local Item_newJL = GetChaItem ( role , 2 , r2 )	
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con ) 
	SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
	SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
end

--���� ���� (ID 0573)
function ItemUse_LZJLD( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \223\233\246\238 \209\232\235\251")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���� ����")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Egg of Strength")
		UseItemFailed ( role )
		return
	end
	local Num_newJL = GetItemForgeParam ( Item , 1 )
	local Part1_newJL = GetNum_Part1 ( Num_newJL )
	local Part2_newJL = GetNum_Part2 ( Num_newJL )	
	local Part3_newJL = GetNum_Part3 ( Num_newJL )

	local new_str=GetItemAttr ( Item , ITEMATTR_VAL_STR )      
	local new_dex=GetItemAttr( Item , ITEMATTR_VAL_DEX  )	  
	local new_sta=GetItemAttr ( Item , ITEMATTR_VAL_STA  )    
	local new_agi=GetItemAttr( Item , ITEMATTR_VAL_AGI )       
	local new_con=GetItemAttr ( Item , ITEMATTR_VAL_CON )  
	local new_lv = new_str + new_con + new_agi + new_dex + new_sta
	local new_MAXENERGY = 240 * ( new_lv + 1 )
	if new_MAXENERGY > 6480 then
		Item_MAXENERGY = 6480
	end
	local new_MAXURE = 5000 + 1000*new_lv
	if new_MAXURE > 32000 then
		Item_MAXURE_NUM = 32000
	end	  

	local rad = math.random ( 1, 100 )
	if Part3_newJL==3 then
		GiveItem ( role , 0 , 609  , 1 , 4 ) 
	end
	if Part3_newJL==2 then
		if rad <=95 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 95 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	if Part3_newJL==1 then
		if rad <=90 then
			GiveItem ( role , 0 , 239  , 1 , 4 ) 
		elseif rad > 90 and rad <=98 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 98 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	local r1,r2 =MakeItem ( role , 232  , 1 , 4 )
	local Item_newJL = GetChaItem ( role , 2 , r2 )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con ) 
	SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
	SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
end

--���� ���� (ID 0574)
function ItemUse_SZJLD( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \223\233\246\238 \196\243\245\224")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���� ����")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Egg of Spirit")
		UseItemFailed ( role )
		return
	end
	local Num_newJL = GetItemForgeParam ( Item , 1 )
	local Part1_newJL = GetNum_Part1 ( Num_newJL )
	local Part2_newJL = GetNum_Part2 ( Num_newJL )	
	local Part3_newJL = GetNum_Part3 ( Num_newJL )

	local new_str=GetItemAttr ( Item , ITEMATTR_VAL_STR )      
	local new_dex=GetItemAttr( Item , ITEMATTR_VAL_DEX  )	  
	local new_sta=GetItemAttr ( Item , ITEMATTR_VAL_STA  )    
	local new_agi=GetItemAttr( Item , ITEMATTR_VAL_AGI )       
	local new_con=GetItemAttr ( Item , ITEMATTR_VAL_CON )  
	local new_lv = new_str + new_con + new_agi + new_dex + new_sta
	local new_MAXENERGY = 240 * ( new_lv + 1 )
	if new_MAXENERGY > 6480 then
		Item_MAXENERGY = 6480
	end
	local new_MAXURE = 5000 + 1000*new_lv
	if new_MAXURE > 32000 then
		Item_MAXURE_NUM = 32000
	end	  

	local rad = math.random ( 1, 100 )
	if Part3_newJL==3 then
		GiveItem ( role , 0 , 609  , 1 , 4 ) 
	end
	if Part3_newJL==2 then
		if rad <=95 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 95 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	if Part3_newJL==1 then
		if rad <=90 then
			GiveItem ( role , 0 , 239  , 1 , 4 ) 
		elseif rad > 90 and rad <=98 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 98 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	local r1,r2 =MakeItem ( role , 234  , 1 , 4 )
	local Item_newJL = GetChaItem ( role , 2 , r2 )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con ) 
	SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
	SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
end

--���� �������� (ID 0575)
function ItemUse_ZZJLD( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \223\233\246\238 \210\238\247\237\238\241\242\232")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���� ��������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Egg of Accuracy")
		UseItemFailed ( role )
		return
	end
	local Num_newJL = GetItemForgeParam ( Item , 1 )
	local Part1_newJL = GetNum_Part1 ( Num_newJL )
	local Part2_newJL = GetNum_Part2 ( Num_newJL )	
	local Part3_newJL = GetNum_Part3 ( Num_newJL )

	local new_str=GetItemAttr ( Item , ITEMATTR_VAL_STR )      
	local new_dex=GetItemAttr( Item , ITEMATTR_VAL_DEX  )	  
	local new_sta=GetItemAttr ( Item , ITEMATTR_VAL_STA  )    
	local new_agi=GetItemAttr( Item , ITEMATTR_VAL_AGI )       
	local new_con=GetItemAttr ( Item , ITEMATTR_VAL_CON )  
	local new_lv = new_str + new_con + new_agi + new_dex + new_sta
	local new_MAXENERGY = 240 * ( new_lv + 1 )
	if new_MAXENERGY > 6480 then
		Item_MAXENERGY = 6480
	end
	local new_MAXURE = 5000 + 1000*new_lv
	if new_MAXURE > 32000 then
		Item_MAXURE_NUM = 32000
	end	  

	local rad = math.random ( 1, 100 )
	if Part3_newJL==3 then
		GiveItem ( role , 0 , 609  , 1 , 4 ) 
	end
	if Part3_newJL==2 then
		if rad <=95 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 95 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	if Part3_newJL==1 then
		if rad <=90 then
			GiveItem ( role , 0 , 239  , 1 , 4 ) 
		elseif rad > 90 and rad <=98 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 98 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	local r1,r2 =MakeItem ( role , 235  , 1 , 4 )
	local Item_newJL = GetChaItem ( role , 2 , r2 )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con ) 
	SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
	SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
end

--���� �������� (ID 0576)
function ItemUse_MZJLD( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \223\233\246\238 \203\238\226\234\238\241\242\232")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���� ��������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Egg of Agility")
		UseItemFailed ( role )
		return
	end
	local Num_newJL = GetItemForgeParam ( Item , 1 )
	local Part1_newJL = GetNum_Part1 ( Num_newJL )
	local Part2_newJL = GetNum_Part2 ( Num_newJL )	
	local Part3_newJL = GetNum_Part3 ( Num_newJL )

	local new_str=GetItemAttr ( Item , ITEMATTR_VAL_STR )      
	local new_dex=GetItemAttr( Item , ITEMATTR_VAL_DEX  )	  
	local new_sta=GetItemAttr ( Item , ITEMATTR_VAL_STA  )    
	local new_agi=GetItemAttr( Item , ITEMATTR_VAL_AGI )       
	local new_con=GetItemAttr ( Item , ITEMATTR_VAL_CON )  
	local new_lv = new_str + new_con + new_agi + new_dex + new_sta
	local new_MAXENERGY = 240 * ( new_lv + 1 )
	if new_MAXENERGY > 6480 then
		Item_MAXENERGY = 6480
	end
	local new_MAXURE = 5000 + 1000*new_lv
	if new_MAXURE > 32000 then
		Item_MAXURE_NUM = 32000
	end	  

	local rad = math.random ( 1, 100 )
	if Part3_newJL==3 then
		GiveItem ( role , 0 , 609  , 1 , 4 ) 
	end
	if Part3_newJL==2 then
		if rad <=95 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 95 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	if Part3_newJL==1 then
		if rad <=90 then
			GiveItem ( role , 0 , 239  , 1 , 4 ) 
		elseif rad > 90 and rad <=98 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 98 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	local r1,r2 =MakeItem ( role , 236  , 1 , 4 )
	local Item_newJL = GetChaItem ( role , 2 , r2 )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con ) 
	SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
	SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
end

--���� ��� (ID 0577)
function ItemUse_XZJLD( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \223\233\246\238 \199\235\224")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���� ���")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Egg of Evil")
		UseItemFailed ( role )
		return
	end
	local Num_newJL = GetItemForgeParam ( Item , 1 )
	local Part1_newJL = GetNum_Part1 ( Num_newJL )
	local Part2_newJL = GetNum_Part2 ( Num_newJL )	
	local Part3_newJL = GetNum_Part3 ( Num_newJL )

	local new_str=GetItemAttr ( Item , ITEMATTR_VAL_STR )      
	local new_dex=GetItemAttr( Item , ITEMATTR_VAL_DEX  )	  
	local new_sta=GetItemAttr ( Item , ITEMATTR_VAL_STA  )    
	local new_agi=GetItemAttr( Item , ITEMATTR_VAL_AGI )       
	local new_con=GetItemAttr ( Item , ITEMATTR_VAL_CON )  
	local new_lv = new_str + new_con + new_agi + new_dex + new_sta
	local new_MAXENERGY = 240 * ( new_lv + 1 )
	if new_MAXENERGY > 6480 then
		Item_MAXENERGY = 6480
	end
	local new_MAXURE = 5000 + 1000*new_lv
	if new_MAXURE > 32000 then
		Item_MAXURE_NUM = 32000
	end	  

	local rad = math.random ( 1, 100 )
	if Part3_newJL==3 then
		GiveItem ( role , 0 , 609  , 1 , 4 ) 
	end
	if Part3_newJL==2 then
		if rad <=95 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 95 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	if Part3_newJL==1 then
		if rad <=90 then
			GiveItem ( role , 0 , 239  , 1 , 4 ) 
		elseif rad > 90 and rad <=98 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 98 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	local r1,r2 =MakeItem ( role , 237  , 1 , 4 )
	local Item_newJL = GetChaItem ( role , 2 , r2 )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con ) 
	SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
	SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
end

--���� ����� �������� (ID 0910)
function ItemUse_MDXZESJLD( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \223\233\246\238 \204\238\240\228\238 \204\235\224\228\248\229\227\238")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���� ����� ��������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Egg of Mordo")
		UseItemFailed ( role )
		return
	end
	local new_str=GetItemAttr ( Item , ITEMATTR_VAL_STR )      
	local new_dex=GetItemAttr( Item , ITEMATTR_VAL_DEX  )	  
	local new_sta=GetItemAttr ( Item , ITEMATTR_VAL_STA  )    
	local new_agi=GetItemAttr( Item , ITEMATTR_VAL_AGI )       
	local new_con=GetItemAttr ( Item , ITEMATTR_VAL_CON )  
	local new_lv = new_str + new_con + new_agi + new_dex + new_sta
	local new_MAXENERGY = 240 * ( new_lv + 1 )
	if new_MAXENERGY > 6480 then
		Item_MAXENERGY = 6480
	end
	local new_MAXURE = 5000 + 1000*new_lv
	if new_MAXURE > 32000 then
		Item_MAXURE_NUM = 32000
	end	  
	GiveItem ( role , 0 , 609  , 1 , 4 ) 
	local r1,r2 =MakeItem ( role , 681  , 1 , 4 )
	local Item_newJL = GetChaItem ( role , 2 , r2 )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con ) 
	SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
	SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
end

--------------------------------------------------------------------------------------------------
--��������
--------------------------------------------------------------------------------------------------

--��� ���. ��. (ID 0239)
function Sk_Script_CJJLFT( role , Item ) 							
 	local sk_add = SK_JLFT  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

 --������� ��� (ID 0608)
function Sk_Script_ZJJLFT ( role , Item ) 							
  	local sk_add = SK_JLFT  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 2 then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 2 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

 --������� ��� (ID 0609)
function Sk_Script_GJJLFT( role , Item ) 							
   	local sk_add = SK_JLFT  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 3  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 3 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--------------------------------------------------------------------------------------------------
--������� ������ ���
--------------------------------------------------------------------------------------------------

--�������� ����� �������� ������� (ID 0276)
function ItemUse_CJ_longguo( role , Item , Item_Traget ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role ) 
		return 
	end 
	local Item_type = GetItemType ( Item )
	local Item_Traget_Type = GetItemType ( Item_Traget )
	local Item_Num = GetItemID ( Item )
	local Check_Exp = 0
	local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 
	--SystemNotice(role ,Elf_MaxEXP )

	if Item_type == 58 and Item_Traget_Type == 59 then
			Check_Exp = CheckElf_EXP ( role , Item_Traget )
			if Check_Exp == 0 then
				SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224. \205\229\226\238\231\236\238\230\237\238 \239\238\234\238\240\236\232\242\252 \244\229\254 \212\240\243\234\242\238\236 \209\237\229\230\237\238\227\238 \196\240\224\234\238\237\224" ) 
				--SystemNotice(role , "���� ��� �� ������ ���������. ���������� ��������� ��� ������� �������� �������" )
				--SystemNotice(role , "Growth rate is not full. Unable to feed pet with Snow Dragon Fruit" )
				UseItemFailed ( role )
			else
			Lvup_Str_1 ( role , Item_Num , Item_Traget )
			end 
	end 
end

--�������� ������� ����� (ID 0277)
function ItemUse_CJ_koumei ( role , Item , Item_Traget ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local Item_type = GetItemType ( Item )
	local Item_Traget_Type = GetItemType ( Item_Traget )
	local Item_Num = GetItemID ( Item )
	local Check_Exp = 0
	local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 

	if Item_type == 58 and Item_Traget_Type == 59 then
			Check_Exp = CheckElf_EXP ( role , Item_Traget )
			if Check_Exp == 0 then
				SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224. \205\229\226\238\231\236\238\230\237\238 \239\238\234\238\240\236\232\242\252 \244\229\254 \206\227\240\238\236\237\238\233 \203\229\228\255\237\238\233 \241\235\232\226\238\233" ) 
				--SystemNotice(role , "���� ��� �� ������ ���������. ���������� ��������� ��� �������� ������� ������" ) 
				--SystemNotice(role , "Growth rate is not full. Unable to feed pet with Icespire Plum" ) 
				UseItemFailed ( role )
			else
			   Lvup_Agi_1 ( role , Item_Num , Item_Traget ) 
			end 
	end 
end

--�������� ������� � ������ (ID 0278)
function ItemUse_CJ_yusi ( role , Item , Item_Traget ) 

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )  
		UseItemFailed ( role ) 
		return 
	end 
	local Item_type = GetItemType ( Item )
	local Item_Traget_Type = GetItemType ( Item_Traget )
	local Item_Num = GetItemID ( Item )
	local Check_Exp = 0
	local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 

	if Item_type == 58 and Item_Traget_Type == 59  then
			Check_Exp = CheckElf_EXP ( role , Item_Traget )
			if Check_Exp == 0 then
				SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224. \205\229\226\238\231\236\238\230\237\238 \239\238\234\238\240\236\232\242\252 \244\229\254 \206\227\240\238\236\237\251\236 \212\232\248\244\235\238\241\238\236 \241 \199\229\244\232\240\224" ) 
				--SystemNotice(role , "���� ��� �� ������ ���������. ���������� ��������� ��� �������� ��������� � ������" ) 
				--SystemNotice(role , "Growth rate is not full. Unable to feed pet with Zephyr Fish Floss" ) 
				UseItemFailed ( role )
			else
			   Lvup_Dex_1 ( role , Item_Num , Item_Traget ) 
			end 
	end 
end

--�������� ���������� ����� (ID 0279)
function ItemUse_CJ_guopu ( role , Item , Item_Traget ) 

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )  
		UseItemFailed ( role ) 
		return 
	end 
	local Item_type = GetItemType ( Item )
	local Item_Traget_Type = GetItemType ( Item_Traget )
	local Item_Num = GetItemID ( Item )
	local Check_Exp = 0
	local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 

	if Item_type == 58 and Item_Traget_Type == 59 then
			Check_Exp = CheckElf_EXP ( role , Item_Traget )
			if Check_Exp == 0 then
				SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224. \205\229\226\238\231\236\238\230\237\238 \239\238\234\238\240\236\232\242\252 \244\229\254 \206\227\240\238\236\237\251\236 \209\229\240\229\225\240\255\237\251\236 \236\224\237\227\238" ) 
				--SystemNotice(role , "���� ��� �� ������ ���������. ���������� ��������� ��� �������� ���������� �����" )
				--SystemNotice(role , "Growth rate is not full. Unable to feed pet with Argent Mango" )
				UseItemFailed ( role )
			else
			   Lvup_Con_1 ( role , Item_Num , Item_Traget )
			end 
	end 
end

--������� ���������� ������� (ID 0280)
function ItemUse_CJ_mibing ( role , Item , Item_Traget ) 

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )  
		UseItemFailed ( role ) 
		return 
	end 
	local Item_type = GetItemType ( Item )
	local Item_Traget_Type = GetItemType ( Item_Traget )
	local Item_Num = GetItemID ( Item )
	local Check_Exp = 0
	local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 

	if Item_type == 58 and Item_Traget_Type == 59  then
			Check_Exp = CheckElf_EXP ( role , Item_Traget )
			if Check_Exp == 0 then
				SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224. \205\229\226\238\231\236\238\230\237\238 \239\238\234\238\240\236\232\242\252 \244\229\254 \193\238\235\252\248\232\236 \216\224\233\242\224\237\241\234\232\236 \225\232\241\234\226\232\242\238\236" ) 
				--SystemNotice(role , "���� ��� �� ������ ���������. ���������� ��������� ��� ������� ���������� ���������" )
				--SystemNotice(role , "Growth rate is not full. Unable to feed pet with Shaitan Biscuit" )
				UseItemFailed ( role )
			else
			   Lvup_Sta_1 ( role , Item_Num , Item_Traget )
			end  
		        --local Item_MAXENERGY = Elf_MaxEXP + 20
			--SetItemAttr ( Item_Traget , ITEMATTR_MAXENERGY , Item_MAXENERGY )				
	end 
end

--����� ����� (Id 0578)
function ItemUse_JLJSGz( role , Item )
    local statelv = 1
    local ChaStateLv = GetChaStateLv ( role , STATE_JLJSGZ )
    if ChaStateLv >= statelv then
        SystemNotice ( role , "����� ����� ��� ��� ������������ " )
        UseItemFailed ( role )
        return
    end
    local statetime = 900
    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
    if Cha_Boat ==  nil then
        AddState( role , role , STATE_JLJSGZ , statelv , statetime )
    else
        AddState( Cha_Boat , Cha_Boat , STATE_JLJSGZ , statelv , statetime )
    end
    SystemNotice ( role ,"���� ����� ��� �������� � 2 ���� �� 15 ����� " )
end

--------------------------------------------------------------------------------------------------
--�������
--------------------------------------------------------------------------------------------------

--��������� ������ ������ 70 ��. (ID 0322)
function ItemUse_70FYZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \207\243\240\239\243\240\237\251\233 \241\243\237\228\243\234 \194\229\228\252\236\251 70 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ��������� ������ ������ 70 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Seal Master Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4204  , 1 , 22) 
end

--��������� ������ �������� 70 ��. (ID 0525)
function ItemUse_70JJZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \207\243\240\239\243\240\237\251\233 \241\243\237\228\243\234 \215\229\236\239\232\238\237\224 70 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ��������� ������ �������� 70 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Champion Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1375 , 1 , 22) 
end

--��������� ������ ������� 70 ��. (ID 0613)
function ItemUse_70SJZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \207\243\240\239\243\240\237\251\233 \241\243\237\228\243\234 \194\238\232\242\229\235\255 70 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ��������� ������ ������� 70 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Crusader Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1394 , 1 , 22) 
end

--��������� ������ ������� 70 ��. (ID 0614)
function ItemUse_70JUJZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \207\243\240\239\243\240\237\251\233 \241\243\237\228\243\234 \209\242\240\229\235\234\224 70 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ��������� ������ ������� 70 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Sharpshooter Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 42 , 1 , 22) 
end

--��������� ������ ���������� ����� 70 ��. (ID 0615)
function ItemUse_70HHZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \207\243\240\239\243\240\237\251\233 \241\243\237\228\243\234 \239\238\234\238\240\232\242\229\235\255 \236\238\240\229\233 70 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ��������� ������ ���������� ����� 70 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Voyager Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1421 , 1 , 22) 
end

--��������� ������ ������������ 70 ��. (ID 0616)
function ItemUse_70SZZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \207\243\240\239\243\240\237\251\233 \241\243\237\228\243\234 \214\229\235\232\242\229\235\252\237\232\246\251 70 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ��������� ������ ������������ 70 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Cleric Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4198 , 1 , 22) 
end

--������ ������� 50 ��. (ID 0617)
function ItemUse_50SJBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \226\238\232\242\229\235\255 50 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ ������� 50 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Crusader Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0299 , 1 , 22) 
	GiveItem ( role , 0 , 0475 , 1 , 22) 
	GiveItem ( role , 0 , 0651 , 1 , 22) 
end

--������ ������� 60 ��. (ID 0618)
function ItemUse_60SJBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \226\238\232\242\229\235\255 60 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ ������� 60 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Crusader Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0304 , 1 , 22) 
	GiveItem ( role , 0 , 0480 , 1 , 22) 
	GiveItem ( role , 0 , 0656 , 1 , 22) 
end

--������ ������� 70 ��. (ID 0619)
function ItemUse_70SJBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 2 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \226\238\232\242\229\235\255 70 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ ������� 70 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Crusader Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4150 , 1 , 22) 
	GiveItem ( role , 0 , 4166 , 1 , 22) 
	GiveItem ( role , 0 , 4182 , 1 , 22) 
end

--������ �������� 50 ��. (ID 0620)
function ItemUse_50JJBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \215\229\236\239\232\238\237\224 50 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ �������� 50 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Champion Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0229 , 1 , 22) 
	GiveItem ( role , 0 , 653 , 1 , 22)  
end

--������ �������� 60 ��. (ID 0621)
function ItemUse_60JJBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \215\229\236\239\232\238\237\224 60 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ �������� 60 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Champion Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0230 , 1 , 22) 
	GiveItem ( role , 0 , 477 , 1 , 22)  
end

--������ �������� 70 ��. (ID 0622)
function ItemUse_70JJBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 2 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \215\229\236\239\232\238\237\224 70 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ �������� 70 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Champion Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4148 , 1 , 22) 
	GiveItem ( role , 0 , 653 , 1 , 22)  
	GiveItem ( role , 0 , 477 , 1 , 22)
end

--������ ������������ 50 ��. (ID 0623)
function ItemUse_50SZBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \214\229\235\232\242\229\235\252\237\232\246\251 50 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ ������������ 50 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Cleric Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0371 , 1 , 22) 
	GiveItem ( role , 0 , 0547 , 1 , 22)  
	GiveItem ( role , 0 , 0723 , 1 , 22) 
end

--������ ������������ 60 ��. (ID 0624)
function ItemUse_60SZBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \214\229\235\232\242\229\235\252\237\232\246\251 60 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ ������������ 60 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Cleric Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0394 , 1 , 22) 
	GiveItem ( role , 0 , 0570 , 1 , 22)  
	GiveItem ( role , 0 , 0746 , 1 , 22) 
end

--������ ������������ 70 ��. (ID 0625)
function ItemUse_70SZBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 2 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \214\229\235\232\242\229\235\252\237\232\246\251 70 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ ������������ 70 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Cleric Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4159 , 1 , 22) 
	GiveItem ( role , 0 , 4175 , 1 , 22)  
	GiveItem ( role , 0 , 4191 , 1 , 22) 
end

--������ ��� ������������ 50 ��. (ID 0626)
function ItemUse_50AMSZBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \192\236\232 \214\229\235\232\242\229\235\252\237\232\246\251 50 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ ��� ������������ 50 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Ami Cleric Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0382 , 1 , 22) 
	GiveItem ( role , 0 , 0558 , 1 , 22)  
	GiveItem ( role , 0 , 0734 , 1 , 22) 
	GiveItem ( role , 0 , 2204 , 1 , 22) 
end

--������ ��� ������������ 60 ��. (ID 0627)
function ItemUse_60AMSZBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \192\236\232 \214\229\235\232\242\229\235\252\237\232\246\251 60 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ ��� ������������ 60 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Ami Cleric Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0393 , 1 , 22) 
	GiveItem ( role , 0 , 0569 , 1 , 22)  
	GiveItem ( role , 0 , 0745 , 1 , 22) 
	GiveItem ( role , 0 , 2215 , 1 , 22) 
end

--������ ������������ ��� 70 ��. (ID 0628)
function ItemUse_70AMSZBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 2 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \192\236\232 \214\229\235\232\242\229\235\252\237\232\246\251 70 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ ��� ������������ 70 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Ami Cleric Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4160 , 1 , 22) 
	GiveItem ( role , 0 , 4176 , 1 , 22)  
	GiveItem ( role , 0 , 4192 , 1 , 22)  
end

--������ ��� ������ 50 ��. (ID 0629)
function ItemUse_50AMFYBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \192\236\232 \194\229\228\252\236\251 50 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ ��� ������ 50 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Ami Seal Master Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0385 , 1 , 22) 
	GiveItem ( role , 0 , 0561 , 1 , 22)  
	GiveItem ( role , 0 , 0737 , 1 , 22) 
	GiveItem ( role , 0 , 2207 , 1 , 22) 
end

--������ ��� ������ 60 ��. (ID 0630)
function ItemUse_60AMFYBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \192\236\232 \194\229\228\252\236\251 60 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ ��� ������ 60 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Ami Seal Master Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0364 , 1 , 22) 
	GiveItem ( role , 0 , 0540 , 1 , 22)  
	GiveItem ( role , 0 , 0716 , 1 , 22) 
	GiveItem ( role , 0 , 2201 , 1 , 22) 
end

--����������� ������ ��� 70 ��. (ID 0631)
function ItemUse_70AMFYBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 2 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \192\236\232 \194\229\228\252\236\251 70 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ ��� ������ 70 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Ami Seal Master Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4164 , 1 , 22) 
	GiveItem ( role , 0 , 4180 , 1 , 22)  
	GiveItem ( role , 0 , 4196 , 1 , 22) 
end

--������ ���������� ����� ��� 50 ��. (ID 0632)
function ItemUse_50AMHHBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \207\238\234\238\240\232\242\229\235\255 \236\238\240\229\233 \192\236\232 50 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ ���������� ����� ��� 50 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Ami Voyager Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0355 , 1 , 22) 
	GiveItem ( role , 0 , 0531 , 1 , 22)  
	GiveItem ( role , 0 , 0707 , 1 , 22) 
	GiveItem ( role , 0 , 2192 , 1 , 22) 
end

--������ ���������� ����� ��� 60 ��. (ID 0633)
function ItemUse_60AMHHBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \207\238\234\238\240\232\242\229\235\255 \236\238\240\229\233 \192\236\232 60 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ ���������� ����� ��� 60 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Ami Voyager Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0358 , 1 , 22) 
	GiveItem ( role , 0 , 0534 , 1 , 22)  
	GiveItem ( role , 0 , 0710 , 1 , 22) 
	GiveItem ( role , 0 , 2195 , 1 , 22) 
end

--������ ���������� ����� ��� 70 ��. (ID 0634)
function ItemUse_70AMHHBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 2 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \207\238\234\238\240\232\242\229\235\255 \236\238\240\229\233 \192\236\232 70 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ ���������� ����� ��� 70 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Ami Voyager Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4156 , 1 , 22) 
	GiveItem ( role , 0 , 4172 , 1 , 22)  
	GiveItem ( role , 0 , 4188 , 1 , 22)  
end

--������ ������� 50 ��. (ID 0671)
function ItemUse_50JUJBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \209\242\240\229\235\234\224 50 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ ������� 50 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Sharpshooter Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0312 , 1 , 22) 
	GiveItem ( role , 0 , 0488 , 1 , 22)  
	GiveItem ( role , 0 , 0664 , 1 , 22) 
end

--������ ������� 60 ��. (ID 0673)
function ItemUse_60JUJBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \209\242\240\229\235\234\224 60 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ ������� 60 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Sharpshooter Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0317 , 1 , 22) 
	GiveItem ( role , 0 , 0493 , 1 , 22)  
	GiveItem ( role , 0 , 0669 , 1 , 22) 
end

--������ ������� 70 �� (ID 0674)
function ItemUse_70JUJBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 2 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \209\242\240\229\235\234\224 70 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ ������� 70 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Sharpshooter Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4152 , 1 , 22) 
	GiveItem ( role , 0 , 4168 , 1 , 22)  
	GiveItem ( role , 0 , 4184 , 1 , 22) 
end

--������ ���������� ����� 50 ��. (ID 0676)
function ItemUse_50HHBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \207\238\234\238\240\232\242\229\235\255 \236\238\240\229\233 50 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ ���������� ����� 50 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Voyager Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0345 , 1 , 22) 
	GiveItem ( role , 0 , 0521 , 1 , 22)  
	GiveItem ( role , 0 , 0697 , 1 , 22) 
end

--������ ���������� ����� 60 ��. (ID 0686)
function ItemUse_60HHBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \207\238\234\238\240\232\242\229\235\255 \236\238\240\229\233 60 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ ���������� ����� 60 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Voyager Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0344 , 1 , 22) 
	GiveItem ( role , 0 , 0520 , 1 , 22)  
	GiveItem ( role , 0 , 0696 , 1 , 22) 
end

--������ ���������� ����� 70 ��. (ID 0698)
function ItemUse_70HHBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 2 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \207\238\234\238\240\232\242\229\235\255 \236\238\240\229\233 70 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ ���������� ����� 70 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Voyager Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4155 , 1 , 22) 
	GiveItem ( role , 0 , 4171 , 1 , 22)  
	GiveItem ( role , 0 , 4187 , 1 , 22) 
end

--������ ������ 50 ��. (ID 0699)
function ItemUse_50FYBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \194\229\228\252\236\251 50 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ ������ 50 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Seal Master Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0369 , 1 , 22) 
	GiveItem ( role , 0 , 0545 , 1 , 22)  
	GiveItem ( role , 0 , 0721 , 1 , 22) 
end

--������ ������ 60 ��. (ID 0700)
function ItemUse_60FYBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \194\229\228\252\236\251 60 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ ������ 60 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Seal Master Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0377 , 1 , 22) 
	GiveItem ( role , 0 , 0553 , 1 , 22)  
	GiveItem ( role , 0 , 0729 , 1 , 22) 
end

--������ ������ 70 ��. (ID 0701)
function ItemUse_70FYBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 2 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \194\229\228\252\236\251 70 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������ ������ 70 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Seal Master Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4163 , 1 , 22) 
	GiveItem ( role , 0 , 4179 , 1 , 22)  
	GiveItem ( role , 0 , 4195 , 1 , 22) 
end

--------------------------------------------------------------------------------------------------
--������� �������
--------------------------------------------------------------------------------------------------

--������� ������� (ID 1119)
function ItemUse_98BOX ( role , Item )
			local item_type = BaoXiang_98BOX
			local item_type_rad = BaoXiang_98BOX_Rad 
			local item_type_count = BaoXiang_98BOX_Count 
			local maxitem = BaoXiang_98BOX_Mxcount
			local item_quality = BaoXiang_98BOX_Qua
			local General = 0  
			local ItemId = 0 
			
		local Item_CanGet = GetChaFreeBagGridNum ( role )
		
		if Item_CanGet <= 0 then
			SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \208\224\233\241\234\232\233 \236\229\248\238\247\229\234")
			--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������� �������")
			--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
			UseItemFailed ( role )
			return
		end
				for i = 1 , maxitem , 1 do 
					General = item_type_rad [ i ] + General		
				end 
				local a = math.random ( 1, General )
				local b = 0
				local d = 0 
				local c = -1
				for k = 1 , maxitem , 1 do

					d = item_type_rad [ k ] + b

					 if a <= d and a > b then
						c = k
						break		
					end 
					b = d 
				end 
				if c == -1 then 
					ItemId = 3124 
				else 
					ItemId = item_type [c]  
					ItemCount = item_type_count [c] 
				end 

				GiveItem ( role , 0 , ItemId , ItemCount , item_quality )
		
				local GoodItem = {}
				GoodItem[0] = 3074
				GoodItem[1] = 0937
				GoodItem[2] = 3885
				GoodItem[3] = 0680
				GoodItem[4] = 0938
				GoodItem[5] = 2488
				GoodItem[6] = 2489
				GoodItem[7] = 2490
				GoodItem[8] =2436
				GoodItem[9] =3075

				local Good_C = 0
				for Good_C = 0 , 9 , 1 do
					if ItemId == GoodItem[Good_C] then
						local itemname = GetItemName ( ItemId ) 
						local cha_name = GetChaDefaultName ( role ) 
						local message = cha_name.." \238\242\234\240\251\226\224\229\242 \208\224\233\241\234\232\233 \236\229\248\238\247\229\234 \232 \239\238\235\243\247\224\229\242 "..itemname  
						--local message = cha_name.." ��������� ������� ������� � �������� "..itemname  
						--local message = cha_name.." opens a Paradise Pouch and obtain "..itemname  
						Notice ( message )
					end
				end
	
	end

--------------------------------------------------------------------------------------------------
--�������� �� ���������
--------------------------------------------------------------------------------------------------

--�������� �� �������� �������� (ID 0856)
function ItemUse_lieyanBook( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \208\224\241\239\232\241\234\243 \237\224 \206\227\237\229\237\237\251\233 \241\224\236\238\246\226\229\242")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ �������� �� �������� ��������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Fiery Gem Voucher")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0878 , 1 , 4) 
end

--�������� �� �������� ������ (ID 0857)
function ItemUse_zhiyanBook( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \208\224\241\239\232\241\234\243 \237\224 \209\224\236\238\246\226\229\242 \223\240\238\241\242\232")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ �������� �� �������� ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Furious Gem Voucher")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0879 , 1 , 4) 
end

--�������� �� ������-�������� (ID 0858)
function ItemUse_huoyaoBook( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \208\224\241\239\232\241\234\243 \237\224 \208\224\231\240\251\226\237\238\233 \241\224\236\238\246\226\229\242")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ �������� �� ��������� ��������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Explosive Gem Voucher")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0880 , 1 , 4) 
end

--�������� �� ����������� �������� (ID 0859)
function ItemUse_manaoBook( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \208\224\241\239\232\241\234\243 \237\224 \203\254\241\242\240\232\237\238\226\251\233 \241\224\236\238\246\226\229\242")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ �������� �� ����������� ��������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lustrious Gem Voucher")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0881 , 1 , 4) 
end

--�������� �� �������� ���� (ID 0911)
function ItemUse_shengguangBook( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \208\224\241\239\232\241\234\243 \237\224 \209\224\236\238\246\226\229\242 \196\243\245\224")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ �������� �� �������� ����")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Spirit Gem Voucher")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0887 , 1 , 4) 
end

--�������� �� ��������� �������� (ID 0915)
function ItemUse_yuezhixinBook( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \208\224\241\239\232\241\234\243 \237\224 \193\235\229\241\242\255\249\232\233 \241\224\236\238\246\226\229\242")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ �������� �� ��������� ��������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Shining Gem Voucher")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0883 , 1 , 4) 
end

--�������� �� ������� �������� (ID 0914)
function ItemUse_hanyuBook( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \208\224\241\239\232\241\234\243 \237\224 \209\232\255\254\249\232\233 \241\224\236\238\246\226\229\242")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ �������� �� ������� ��������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Glowing Gem Voucher")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0882 , 1 , 4) 
end

--�������� �� �������� ����� (ID 0918)
function ItemUse_fenglingBook( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \208\224\241\239\232\241\234\243 \237\224 \209\224\236\238\246\226\229\242 \194\229\242\240\224")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ �������� �� �������� �����")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Gem of the Wind Voucher")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0860 , 1 , 4) 
end

--�������� �� ������� �������� (ID 0916)
function ItemUse_xianlingBook( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \208\224\241\239\232\241\234\243 \237\224 \210\229\237\229\226\238\233 \241\224\236\238\246\226\229\242")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ �������� �� ������� ��������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Shadow Gem Voucher")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0884 , 1 , 4) 
end

--�������� �� �������� ����� (ID 0919)
function ItemUse_yingyanBook( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \208\224\241\239\232\241\234\243 \237\224 \209\224\236\238\246\226\229\242 \243\228\224\240\224")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ �������� �� �������� �����")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Gem of Striking Voucher")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0861 , 1 , 4) 
end

--�������� �� �������� ������� (ID 0920)
function ItemUse_yanyuBook( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \208\224\241\239\232\241\234\243 \237\224 \209\224\236\238\246\226\229\242 \234\238\235\238\241\241\224")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ �������� �� �������� �������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Gem of Colossus Voucher")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0862 , 1 , 4) 
end

--�������� �� �������� ������ (ID 0921)
function ItemUse_tanyuBook( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \208\224\241\239\232\241\234\243 \237\224 \209\224\236\238\246\226\229\242 \223\240\238\241\242\232")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ �������� �� �������� ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Gem of Rage Voucher")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0863 , 1 , 4) 
end

--------------------------------------------------------------------------------------------------
--�������
--------------------------------------------------------------------------------------------------

--��������� ������ ������� 50 ��. (ID 0939)
function ItemUse_50SJZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \207\243\240\239\243\240\237\251\233 \241\243\237\228\243\234 \194\238\232\242\229\235\255 50 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ��������� ������ ������� 50 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Crusader Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1392 , 1 , 22) 
end

--��������� ������ �������� 50 ��. (ID 0940)
function ItemUse_50JJZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \207\243\240\239\243\240\237\251\233 \241\243\237\228\243\234 \215\229\236\239\232\238\237\224 50 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ��������� ������ �������� 50 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Champion Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1373 , 1 , 22) 
end

--��������� ������ ������� 50 ��. (ID 0941)
function ItemUse_50JUJZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \207\243\240\239\243\240\237\251\233 \241\243\237\228\243\234 \209\242\240\229\235\234\224 50 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ��������� ������ ������� 50 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Sharpshooter Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0040 , 1 , 22) 
end

--��������� ������ ���������� ����� 50 ��.(ID 0942)
function ItemUse_50HHZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \207\243\240\239\243\240\237\251\233 \241\243\237\228\243\234 \207\238\234\238\240\232\242\229\235\255 \236\238\240\229\233 50 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ��������� ������ ���������� ����� 50 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Voyager Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1419 , 1 , 22) 
end

--��������� ������ ������������ 50 ��. (ID 0943)
function ItemUse_50SZZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \207\243\240\239\243\240\237\251\233 \241\243\237\228\243\234 \214\229\235\232\242\229\235\252\237\232\246\251 50 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ��������� ������ ������������ 50 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Cleric Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0103 , 1 , 22) 
end

--��������� ������ ������ 50 ��. (ID 0944)
function ItemUse_50FYZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \207\243\240\239\243\240\237\251\233 \241\243\237\228\243\234 \194\229\228\252\236\251 50 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ��������� ������ ������ 50 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Seal Master Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0102 , 1 , 22) 
end

--��������� ������ ������� 60 ��. (ID 0945)
function ItemUse_60SJZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \207\243\240\239\243\240\237\251\233 \241\243\237\228\243\234 \194\238\232\242\229\235\255 60 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ��������� ������ ������� 60 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Crusader Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1393 , 1 , 22) 
end

--��������� ������ �������� 60 ��. (ID 0946)
function ItemUse_60JJZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \207\243\240\239\243\240\237\251\233 \241\243\237\228\243\234 \215\229\236\239\232\238\237\224 60 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ��������� ������ �������� 60 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Champion Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1374 , 1 , 22) 
end

--��������� ������ ������� 60 ��. (ID 0947
function ItemUse_60JUJZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \207\243\240\239\243\240\237\251\233 \241\243\237\228\243\234 \209\242\240\229\235\234\224 60 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ��������� ������ ������� 60 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Sharpshooter Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0041 , 1 , 22) 
end

--��������� ������ ���������� ����� 60 ��. (ID 0950)
function ItemUse_60HHZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \207\243\240\239\243\240\237\251\233 \241\243\237\228\243\234 \207\238\234\238\240\232\242\229\235\255 \236\238\240\229\233 60 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ��������� ������ ���������� ����� 60 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Voyager Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1420 , 1 , 22) 
end

--��������� ������ ������������ 60 ��. (ID 0951)
function ItemUse_60SZZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \207\243\240\239\243\240\237\251\233 \241\243\237\228\243\234 \214\229\235\232\242\229\235\252\237\232\246\251 60 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ��������� ������ ������������ 60 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Cleric Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4303 , 1 , 22) 
end

--��������� ������ ������ 60 ��. (ID 0952)
function ItemUse_60FYZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \207\243\240\239\243\240\237\251\233 \241\243\237\228\243\234 \194\229\228\252\236\251 60 \243\240\238\226\237\255")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ��������� ������ ������ 60 ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Seal Master Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4300 , 1 , 22) 
end

--------------------------------------------------------------------------------------------------
--������
--------------------------------------------------------------------------------------------------

--������ ���������� (ID 1009)
function ItemUse_CZZX( role , Item )
	local statelv = 1
	local statetime = 30
	local Item_ID=GetItemID(Item)
	AddState( role , role , STATE_CZZX , statelv , statetime )
	if Item_ID~=1013 then
		GiveItem ( role , 0 , 1010 , 1 , 4)
	end
end

--����������� ����� (ID 1011)
function ItemUse_HHLP( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local CheckDateNum = NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	local star = 0


	if CheckDateNum >= 10122  and CheckDateNum <= 10123 then
		ItemUse_XNBOX ( role , Item )


	--if CheckDateNum >= 100122  and CheckDateNum <= 100123 then
		--star=1
	--end
	--if CheckDateNum >= 100622  and CheckDateNum <= 100623 then
		--star=1
	--end
	--if star ==1 then
		--ItemUse_BaoZhaBOX ( role , Item )	
	end
end

--���������� (ID n\a)
function ItemUse_GNZS( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		local attr_sta = GetChaAttr( role , ATTR_STA )
		local sta_extre = 5
		attr_sta = attr_sta + sta_extre 
		SetCharaAttr( attr_sta, role, ATTR_STA )
	else
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

--���������� ���� ��� (ID 1015)
function ItemUse_JNJLD( role , Item )
	local star=math.random ( 1, 10 )
	local r1 = 0
	local r2 = 0
	if star==1 then
		r1,r2=MakeItem( role , 183 , 1 , 4)
	elseif  star==2 then
		r1,r2=MakeItem( role , 184 , 1 , 4)
	elseif  star==3 then
		r1,r2=MakeItem( role , 185 , 1 , 4)
	elseif  star==4 then
		r1,r2=MakeItem( role , 186 , 1 , 4)
	elseif  star==5 then
		r1,r2=MakeItem( role , 187 , 1 , 4)
	elseif  star==6 then
		r1,r2=MakeItem( role , 188 , 1 , 4)
	elseif  star==7 then
		r1,r2=MakeItem( role , 189 , 1 , 4)
	elseif  star==8 then
		r1,r2=MakeItem( role , 190 , 1 , 4)
	elseif  star==9 then
		r1,r2=MakeItem( role , 191 , 1 , 4)
	else  
		r1,r2=MakeItem( role , 199 , 1 , 4)
	end
	local Item_newJL = GetChaItem ( role , 2 , r2 )
	local Num_newJL = GetItemForgeParam ( Item_newJL , 1 )
	local Part1_newJL = GetNum_Part1 ( Num_newJL )
	local Part2_newJL = GetNum_Part2 ( Num_newJL )	
	local Part3_newJL = GetNum_Part3 ( Num_newJL )
	local Part4_newJL = GetNum_Part4 ( Num_newJL )
	local Part5_newJL = GetNum_Part5 ( Num_newJL )
	local Part6_newJL = GetNum_Part6 ( Num_newJL )
	local Part7_newJL= GetNum_Part7 ( Num_newJL )
	local t={}
		t[0]=1
		t[1]=2
		t[2]=3
		t[3]=4
		t[4]=5
	local eleven=math.random ( 1,3 )
	Part2_newJL=t[eleven-1]
	Part4_newJL=t[eleven]
	Part6_newJL=t[eleven+1]
	Num_newJL = SetNum_Part2 ( Num_newJL , Part2_newJL )
	Num_newJL = SetNum_Part3 ( Num_newJL , 1 )
	Num_newJL = SetNum_Part4 ( Num_newJL , Part4_newJL )
	Num_newJL = SetNum_Part5 ( Num_newJL , 1 )
	Num_newJL = SetNum_Part6 ( Num_newJL , Part6_newJL )
	Num_newJL = SetNum_Part7 ( Num_newJL , 1 )
	SetItemForgeParam ( Item_newJL , 1 , Num_newJL )
end

--������ ������� ������ (ID 1014)
function ItemUse_NSSN ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local star = 0
	star =IsChaInRegion( role, 2 )
	if star == 1 then
		SystemNotice( role , "\205\229\226\238\231\236\238\230\237\238 \226\251\231\226\224\242\252 \193\238\227\232\237\254 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229" )
		--SystemNotice( role , "���������� ������� ������ � ���������� ����" )
		--SystemNotice( role , "Unable to summon monster in Safe Zone" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	local MonsterID = 857
	local Refresh = 3700
	local life = 3600000
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaLifeTime( new, life )
end

--������� ������ (ID 1016)
function ItemUse_NSDXB ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \204\229\248\238\247\229\234 \193\238\227\232\237\232")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ������� ������")
		--SystemNotice(role ,"Insufficient slot in inventory. Failed to activate Goddess's Pouch")
		UseItemFailed ( role )
		return
	end
	local star=math.random ( 1, 12 )
	local r1 = 0
	local r2 = 0
	if star==1 then
		r1,r2=MakeItem( role , 619 , 1 , 4)
	elseif star==2 then
		r1,r2=MakeItem( role , 625 , 1 , 4)
	elseif  star==3 then
		r1,r2=MakeItem( role , 628 , 1 , 4)
	elseif  star==4 then
		r1,r2=MakeItem( role , 631 , 1 , 4)
	elseif  star==5 then
		r1,r2=MakeItem( role , 634 , 1 , 4)
	elseif  star==6 then
		r1,r2=MakeItem( role , 674 , 1 , 4)
	elseif  star==7 then
		r1,r2=MakeItem( role , 698 , 1 , 4)
	elseif  star==8 then
		r1,r2=MakeItem( role , 701 , 1 , 4)
	else 
		local eleven =math.random ( 2530, 2548 )
		r1,r2=MakeItem( role , eleven , 1 , 4)
	end
	local Item_new = GetChaItem ( role , 2 , r2 )
	local Item_ID = GetItemID ( Item_new )
	local itemname = GetItemName (Item_ID) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \204\229\248\238\247\229\234 \193\238\227\232\237\232 \232 \239\238\235\243\247\224\229\242 "..itemname  
	--local message = cha_name.." ��������� ������� ������ � �������� "..itemname 
	--local message = cha_name.." opens Goddess's Pouch and obtain "..itemname 
	Notice ( message )
end

--����������� ������ (ID 1017)
function ItemUse_JaNaBox ( role , Item ) 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \192\241\234\224\240\238\237\241\234\232\233 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ����������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1012 , 1 , 4) 			
	local itemname = GetItemName (1012) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." \238\242\234\240\251\226\224\229\242 \192\241\234\224\240\238\237\241\234\232\233 \241\243\237\228\243\234 \232 \239\238\235\243\247\224\229\242 "..itemname  
	--local message = cha_name.." ��������� ����������� ������ � �������� "..itemname 
	--local message = cha_name.." opens Chest of Ascaron and obtain "..itemname 
	Notice ( message )
end

--------------------------------------------------------------------------------------------------
--������ �����
--------------------------------------------------------------------------------------------------

--���������� (ID n\a)
function gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	local cha_name = GetChaDefaultName ( role ) 
	local General = 0  
	local ItemId = 0 
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
		--SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break		
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	if ItemId==0845 or ItemId==0846 or ItemId==0847 or ItemId==0848 then
		local check_rad = math.random ( 1, 100 )
		local heilong_rad = math.random ( 1, 1000 )
		if check_rad==99 and heilong_rad>=999 then
			item_quality=16
		elseif  check_rad==99 and  heilong_rad>=900 then 
			item_quality=15
		elseif  check_rad==99 and  heilong_rad>=500 then 
			item_quality=14
		elseif  check_rad==99 and  heilong_rad>=200 then 
			item_quality=13
		elseif  check_rad==99 then  
			item_quality=12
		else 
			ItemId=0266
		end
	end	
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality )
	local GoodItem = {}
	GoodItem[0] = 0845
	GoodItem[1] = 0846
	GoodItem[2] = 0847
	GoodItem[3] = 0848
	GoodItem[4] = 0266
	local Good_C = 0
	for Good_C = 0 , 4 , 1 do
		if ItemId == GoodItem[Good_C] then
			local itemname = GetItemName ( ItemId ) 
			local message = cha_name.." \238\242\234\240\251\226\224\229\242 \209\237\224\240\255\230\229\237\232\229 \215\229\240\237\251\233 \208\251\237\238\234 \232 \239\238\235\243\247\224\229\242 "..itemname  
			--local message = cha_name.." ��������� ���������� ������ ����� � �������� "..itemname 
			--local message = cha_name.." opens a Black Market Equipment and obtain "..itemname 
			Notice ( message )
		end
	end
	--LG( "HeiShiZhangBei_XinXi" , cha_name , ItemId )

	return 1
end

--���������� ������ ����� (ID 3302 - 3334_
function ItemUse_jsyla( role , Item )
	local item_quality =BaoXiang_jsyla_Qua
	local maxitem = BaoXiang_jsyla_Mxcount
	local item_type = BaoXiang_jsyla
	local item_type_rad =BaoXiang_jsyla_Rad

	local item_type_count =BaoXiang_jsyla_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jsylb( role , Item )
	local item_quality =BaoXiang_jsylb_Qua
	local maxitem =BaoXiang_jsylb_Mxcount
	local item_type = BaoXiang_jsylb
	local item_type_rad =BaoXiang_jsylb_Rad

	local item_type_count =BaoXiang_jsylb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jsmzlra( role , Item )
	local item_quality =BaoXiang_jsmzlra_Qua
	local maxitem =BaoXiang_jsmzlra_Mxcount
	local item_type = BaoXiang_jsmzlra
	local item_type_rad =BaoXiang_jsmzlra_Rad

	local item_type_count =BaoXiang_jsmzlra_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jsmzlrb( role , Item )
	local item_quality =BaoXiang_jsmzlrb_Qua
	local maxitem =BaoXiang_jsmzlrb_Mxcount
	local item_type = BaoXiang_jsmzlrb
	local item_type_rad =BaoXiang_jsmzlrb_Rad

	local item_type_count =BaoXiang_jsmzlrb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jsjqa( role , Item )
	local item_quality =BaoXiang_jsjqa_Qua
	local maxitem =BaoXiang_jsjqa_Mxcount
	local item_type = BaoXiang_jsjqa
	local item_type_rad =BaoXiang_jsjqa_Rad

	local item_type_count =BaoXiang_jsjqa_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jsjqb( role , Item )
	local item_quality =BaoXiang_jsjqb_Qua
	local maxitem =BaoXiang_jsjqb_Mxcount
	local item_type = BaoXiang_jsjqb
	local item_type_rad =BaoXiang_jsjqb_Rad

	local item_type_count =BaoXiang_jsjqb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jsmzcja( role , Item )
	local item_quality =BaoXiang_jsmzcja_Qua
	local maxitem =BaoXiang_jsmzcja_Mxcount
	local item_type = BaoXiang_jsmzcja
	local item_type_rad =BaoXiang_jsmzcja_Rad

	local item_type_count =BaoXiang_jsmzcja_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jsmzcjb( role , Item )
	local item_quality =BaoXiang_jsmzcjb_Qua
	local maxitem =BaoXiang_jsmzcjb_Mxcount
	local item_type = BaoXiang_jsmzcjb
	local item_type_rad =BaoXiang_jsmzcjb_Rad

	local item_type_count =BaoXiang_jsmzcjb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jssjkja( role , Item )
	local item_quality =BaoXiang_jssjkja_Qua
	local maxitem =BaoXiang_jssjkja_Mxcount
	local item_type = BaoXiang_jssjkja
	local item_type_rad =BaoXiang_jssjkja_Rad

	local item_type_count =BaoXiang_jssjkja_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jssjkjb( role , Item )
	local item_quality =BaoXiang_jssjkjb_Qua
	local maxitem =BaoXiang_jssjkjb_Mxcount
	local item_type = BaoXiang_jssjkjb
	local item_type_rad =BaoXiang_jssjkjb_Rad

	local item_type_count =BaoXiang_jssjkjb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jszjkja( role , Item )
	local item_quality =BaoXiang_jszjkja_Qua
	local maxitem =BaoXiang_jszjkja_Mxcount
	local item_type = BaoXiang_jszjkja
	local item_type_rad =BaoXiang_jszjkja_Rad

	local item_type_count =BaoXiang_jszjkja_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jszjkjb( role , Item )
	local item_quality =BaoXiang_jszjkjb_Qua
	local maxitem =BaoXiang_jszjkjb_Mxcount
	local item_type = BaoXiang_jszjkjb
	local item_type_rad =BaoXiang_jszjkjb_Rad

	local item_type_count =BaoXiang_jszjkjb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jsszkja( role , Item )
	local item_quality =BaoXiang_jsszkja_Qua
	local maxitem =BaoXiang_jsszkja_Mxcount
	local item_type = BaoXiang_jsszkja
	local item_type_rad =BaoXiang_jsszkja_Rad

	local item_type_count =BaoXiang_jsszkja_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jsszkjb( role , Item )
	local item_quality =BaoXiang_jsszkjb_Qua
	local maxitem =BaoXiang_jsszkjb_Mxcount
	local item_type = BaoXiang_jsszkjb
	local item_type_rad =BaoXiang_jsszkjb_Rad

	local item_type_count =BaoXiang_jsszkjb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jsfykja( role , Item )
	local item_quality =BaoXiang_jsfykja_Qua
	local maxitem =BaoXiang_jsfykja_Mxcount
	local item_type = BaoXiang_jsfykja
	local item_type_rad =BaoXiang_jsfykja_Rad

	local item_type_count =BaoXiang_jsfykja_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jsfykjb( role , Item )
	local item_quality =BaoXiang_jsfykjb_Qua
	local maxitem =BaoXiang_jsfykjb_Mxcount
	local item_type = BaoXiang_jsfykjb
	local item_type_rad =BaoXiang_jsfykjb_Rad

	local item_type_count =BaoXiang_jsfykjb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jshhkja( role , Item )
	local item_quality =BaoXiang_jshhkja_Qua
	local maxitem =BaoXiang_jshhkja_Mxcount
	local item_type = BaoXiang_jshhkja
	local item_type_rad =BaoXiang_jshhkja_Rad

	local item_type_count =BaoXiang_jshhkja_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jshhkjb( role , Item )
	local item_quality =BaoXiang_jshhkjb_Qua
	local maxitem =BaoXiang_jshhkjb_Mxcount
	local item_type = BaoXiang_jshhkjb
	local item_type_rad =BaoXiang_jshhkjb_Rad

	local item_type_count =BaoXiang_jshhkjb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jsjjkja( role , Item )
	local item_quality =BaoXiang_jsjjkja_Qua
	local maxitem =BaoXiang_jsjjkja_Mxcount
	local item_type = BaoXiang_jsjjkja
	local item_type_rad =BaoXiang_jsjjkja_Rad

	local item_type_count =BaoXiang_jsjjkja_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jsjjkjb( role , Item )
	local item_quality =BaoXiang_jsjjkjb_Qua
	local maxitem =BaoXiang_jsjjkjb_Mxcount
	local item_type = BaoXiang_jsjjkjb
	local item_type_rad =BaoXiang_jsjjkjb_Rad

	local item_type_count =BaoXiang_jsjjkjb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jshlza( role , Item )
	local item_quality =BaoXiang_jshlza_Qua
	--local 
	local maxitem =BaoXiang_jshlza_Mxcount
	local item_type = BaoXiang_jshlza
	local item_type_rad =BaoXiang_jshlza_Rad

	local item_type_count =BaoXiang_jshlza_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jshlzb( role , Item )
	local item_quality =BaoXiang_jshlzb_Qua
	local maxitem =BaoXiang_jshlzb_Mxcount
	local item_type = BaoXiang_jshlzb
	local item_type_rad =BaoXiang_jshlzb_Rad

	local item_type_count =BaoXiang_jshlzb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jshlta( role , Item )
	local item_quality =BaoXiang_jshlta_Qua
	local maxitem =BaoXiang_jshlta_Mxcount
	local item_type = BaoXiang_jshlta
	local item_type_rad =BaoXiang_jshlta_Rad

	local item_type_count =BaoXiang_jshlta_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jshlsa( role , Item )
	local item_quality =BaoXiang_jshlsa_Qua
	local maxitem =BaoXiang_jshlsa_Mxcount
	local item_type = BaoXiang_jshlsa
	local item_type_rad =BaoXiang_jshlsa_Rad

	local item_type_count =BaoXiang_jshlsa_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jshlsb( role , Item )
	local item_quality =BaoXiang_jshlsb_Qua
	local maxitem =BaoXiang_jshlsb_Mxcount
	local item_type = BaoXiang_jshlsb
	local item_type_rad =BaoXiang_jshlsb_Rad

	local item_type_count =BaoXiang_jshlsb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jshlya( role , Item )
	local item_quality =BaoXiang_jshlya_Qua
	local maxitem =BaoXiang_jshlya_Mxcount
	local item_type = BaoXiang_jshlya
	local item_type_rad =BaoXiang_jshlya_Rad

	local item_type_count =BaoXiang_jshlya_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jshlyb( role , Item )
	local item_quality =BaoXiang_jshlyb_Qua
	local maxitem =BaoXiang_jshlyb_Mxcount
	local item_type = BaoXiang_jshlyb
	local item_type_rad =BaoXiang_jshlyb_Rad

	local item_type_count =BaoXiang_jshlyb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jsmhzca( role , Item )
	local item_quality =BaoXiang_jsmhzca_Qua
	local maxitem =BaoXiang_jsmhzca_Mxcount
	local item_type = BaoXiang_jsmhzca
	local item_type_rad =BaoXiang_jsmhzca_Rad

	local item_type_count =BaoXiang_jsmhzca_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jsmhzcb( role , Item )
	local item_quality =BaoXiang_jsmhzcb_Qua
	local maxitem =BaoXiang_jsmhzcb_Mxcount
	local item_type = BaoXiang_jsmhzcb
	local item_type_rad =BaoXiang_jsmhzcb_Rad

	local item_type_count =BaoXiang_jsmhzcb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jsmzfza( role , Item )
	local item_quality =BaoXiang_jsmzfza_Qua
	local maxitem =BaoXiang_jsmzfza_Mxcount
	local item_type = BaoXiang_jsmzfza
	local item_type_rad =BaoXiang_jsmzfza_Rad

	local item_type_count =BaoXiang_jsmzfza_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jsmzfzb( role , Item )
	local item_quality =BaoXiang_jsmzfzb_Qua
	local maxitem =BaoXiang_jsmzfza_Mxcount
	local item_type = BaoXiang_jsmzfzb
	local item_type_rad =BaoXiang_jsmzfzb_Rad

	local item_type_count =BaoXiang_jsmzfzb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jsmfzza( role , Item )
	local item_quality =BaoXiang_jsmfzza_Qua
	local maxitem =BaoXiang_jsmfzza_Mxcount
	local item_type = BaoXiang_jsmfzza
	local item_type_rad =BaoXiang_jsmfzza_Rad

	local item_type_count =BaoXiang_jsmfzza_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jsmfzzb( role , Item )
	local item_quality =BaoXiang_jsmfzzb_Qua
	local maxitem =BaoXiang_jsmfzzb_Mxcount
	local item_type = BaoXiang_jsmfzzb
	local item_type_rad =BaoXiang_jsmfzzb_Rad

	local item_type_count =BaoXiang_jsmfzzb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jsmzcqa( role , Item )
	local item_quality =BaoXiang_jsmzcqa_Qua
	local maxitem =BaoXiang_jsmzcqa_Mxcount
	local item_type = BaoXiang_jsmzcqa
	local item_type_rad =BaoXiang_jsmzcqa_Rad

	local item_type_count =BaoXiang_jsmzcqa_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

function ItemUse_jsmzcqa( role , Item )
	local item_quality =BaoXiang_jsmzcqa_Qua
	local maxitem =BaoXiang_jsmzcqa_Mxcount
	local item_type = BaoXiang_jsmzcqa
	local item_type_rad =BaoXiang_jsmzcqa_Rad

	local item_type_count =BaoXiang_jsmzcqa_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

--------------------------------------------------------------------------------------------------
--������
--------------------------------------------------------------------------------------------------

--������� ������� ������� (ID 1019)
function ItemUse_minibh( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"\215\242\238\225\251 \238\242\234\240\251\242\252 \204\229\248\238\247\229\234 \215\229\240\237\238\227\238 \228\240\224\234\238\237\224 \239\238 \234\240\224\233\237\229\233 \236\229\240\229 \242\240\229\225\243\229\242\241\255 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \194\224\248\229\236 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"����� ������� ������� ������� ������� �� ������� ���� ��������� 1 ��������� ���� � ����� ���������")
		--SystemNotice(role ,"Inventory requires at least 1 empty slot")
		UseItemFailed ( role )
		return
	end
	local cha_name = GetChaDefaultName ( role ) 
	local star=math.random ( 1, 10000 )
	if star==1 then
		GiveItem ( role , 0 , 272  , 1 , 4  )
		local message = cha_name.." \238\242\234\240\251\226\224\229\242 \204\229\248\238\247\229\234 \215\229\240\237\238\227\238 \228\240\224\234\238\237\224 \232 \239\238\235\243\247\224\229\242 \195\240\224\237-\239\240\232: \209\237\224\240\255\230\229\237\232\229 \247\229\240\237\238\227\238 \228\240\224\234\238\237\224" 
		--local message = cha_name.." ��������� ������� ������� ������� � �������� ����-���: ���������� ������� �������" 
		--local message = cha_name.." opens a Mini Black Dragon Bag and obtained the Grand Prize: Black Dragon Set" 
		Notice ( message )
	elseif star>1 and star<=51 then
		GiveItem ( role , 0 , 273  , 1 , 4  ) 
		local message1 = cha_name.." \238\242\234\240\251\226\224\229\242 \204\229\248\238\247\229\234 \215\229\240\237\238\227\238 \228\240\224\234\238\237\224 \232 \239\238\235\243\247\224\229\242 \207\229\240\226\251\233 \239\240\232\231: \198\243\240\237\224\235 \209\247\224\241\242\235\232\226\251\233 \206\242\228\251\245" 
		--local message1 = cha_name.." ��������� ������� ������� ������� � �������� ������ ����: ������ ���������� �����" 
		--local message1 = cha_name.." opens a Mini Black Dragon Bag and obtained the First Prize: Happy Holiday Magazine" 
		Notice ( message1 )
	elseif star>51 and star<1652 then
		GiveItem ( role , 0 , 274  , 1 , 4  ) 
	else
		GiveItem ( role , 0 , 275  , 1 , 4  ) 
	end
end

--������ ������ ���� (ID 1021)
function ItemUse_kala( role , Item )
	local statelv = 1
	local statetime = 20
	AddState( role , role , STATE_KALA , statelv , statetime )
end

--����������� ������� ������� (ID 1027)
function ItemUse_MHDYSD ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local star = 0
	star =IsChaInRegion( role, 2 )
	if star == 1 then
		SystemNotice( role , "\205\229\226\238\231\236\238\230\237\238 \226\251\231\226\224\242\252 \236\238\237\241\242\240\224 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229" )
		--SystemNotice( role , "���������� ������� ������� � ���������� ����" )
		--SystemNotice( role , "Unable to summon monster in Safe Zone" )
		UseItemFailed ( role )
		return
	end
	--local pet_num = GetPetNum(role)
	--if pet_num > 1 then
	--	SystemNotice( role , "You have reached the maximum number of pets!" )
	--	return
	--end
	local x, y = GetChaPos(role)
	local MonsterID = 858
	local Refresh = 190
	local life = 180000
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	--SetChaHost(new,role)
	SetChaLifeTime( new, life )
	--SetChaTarget(new, role)
end

--����� ������������ ������ (ID 1036)
function ItemUse_mohuan( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \202\224\240\242\243 \231\224\247\224\240\238\226\224\237\237\238\233 \193\238\227\232\237\232")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ����� ������������ ������")
		--SystemNotice(role ,"Inventory requires at least 1 empty slot")
		UseItemFailed ( role )
		return
	end
	local cha_name = GetChaDefaultName ( role ) 
	local star=math.random ( 1, 1000 )
	SystemNotice(role ,"star=="..star)
	if star<=8 then
		GiveItem ( role , 0 , 1014  , 1 , 4  )
		local message = cha_name.." \232\241\239\238\235\252\231\243\229\242 \202\224\240\242\243 \231\224\247\224\240\238\226\224\237\237\238\233 \193\238\227\232\237\232 \232 \239\238\235\243\247\224\229\242 \209\226\232\242\238\234 \239\240\232\231\251\226\224 \193\238\227\232\237\232" 
		--local message = cha_name.." ���������� ����� ������������ ������ � �������� ������ ������� ������"
		--local message = cha_name.." opens a Enchanting Goddess Card and obtained Goddess's Trainee Ceremony"
		Notice ( message )
	elseif star>=9 and star<=17 then
		GiveItem ( role , 0 , 271, 1 , 4  ) 
		local message2 = cha_name.." \232\241\239\238\235\252\231\243\229\242 \202\224\240\242\243 \231\224\247\224\240\238\226\224\237\237\238\233 \193\238\227\232\237\232 \232 \239\238\235\243\247\224\229\242 \192\237\227\229\235\252\241\234\232\229 \234\238\241\242\232" 
		--local message2 = cha_name.." ���������� ����� ������������ ������ � �������� ���������� �����"
		--local message2 = cha_name.." opens an Enchanting Goddess Card and obtained Angelic Dice"
		Notice ( message1 )
	elseif star>=18 and star<=27 then
		GiveItem ( role , 0 , 1012, 1 , 4  ) 
		local message3 = cha_name.." \232\241\239\238\235\252\231\243\229\242 \202\224\240\242\243 \231\224\247\224\240\238\226\224\237\237\238\233 \193\238\227\232\237\232 \232 \239\238\235\243\247\224\229\242 \192\241\234\224\240\238\237\241\234\232\233 \241\243\237\228\243\234" 
		--local message3 = cha_name.." ���������� ����� ������������ ������ � �������� ����������� ������"
		--local message3 = cha_name.." opens an Enchanting Goddess Card and obtained Chest of Ascaron"
		Notice ( message3 )
	elseif star>=28 and star<=227 then
		GiveItem ( role , 0 , 3886, 1 , 4  ) 
	else
		GiveItem ( role , 0 , 3830, 5 , 4  ) 
	end
end

--������ ���������� ����� (ID 1035)
function ItemUse_MoHuanBox( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"\210\240\229\225\243\229\242\241\255 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \194\224\248\229\236 \232\237\226\229\237\242\224\240\229, \247\242\238\225\251 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \234\238\235\228\238\226\241\234\238\233 \234\224\240\242\251")
		--SystemNotice(role ,"��������� 1 ��������� ���� � ����� ���������, ����� ������� ������ ���������� �����")
		UseItemFailed ( role )
		return
	end
	local star=math.random ( 1, 4663 )
	if star>=1 and star<=3 then
		GiveItem ( role , 0 , 3866, 1 , 4  ) 	
	elseif star>=4 and star<=14 then
		GiveItem ( role , 0 , 3864, 1 , 4  ) 		
	elseif star>=15 and star<=65 then
		GiveItem ( role , 0 , 3858, 1 , 4  )		
	else
		local star=math.random ( 3850, 3875 )
		if star==3858 or star==3864 or star==3866  then
			GiveItem ( role , 0 , 3850  , 1 , 4  ) 
		else 
			GiveItem ( role , 0 , star  , 1 , 4  ) 			
		end
	end
end

--------------------------------------------------------------------------------------------------
--���������������
--------------------------------------------------------------------------------------------------

--��������������� ���. ��. (Id 0610)
function Sk_Script_CJJLZB( role , Item ) 							
 	local sk_add = SK_JLZB  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

 --������� ��������������� (ID 0611)
function Sk_Script_ZJJLZB ( role , Item ) 							
  	local sk_add = SK_JLZB
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 2 then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 2 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

 --��������������� ���. ��. (ID 0612)
function Sk_Script_GJJLZB( role , Item ) 							
   	local sk_add = SK_JLZB  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 3  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 3 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--------------------------------------------------------------------------------------------------
--������� (ID 1000 - 1003)
--------------------------------------------------------------------------------------------------

--������ ������� (ID 1000)
function ItemUse_MHDTZ( role , Item ) 							
 	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		SystemNotice(role ,"\215\242\238\225\251 \240\224\241\239\229\247\224\242\224\242\252 \247\229\240\242\229\230 \239\238 \234\240\224\233\237\229\233 \236\229\240\229 \242\240\229\225\243\229\242\241\255 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \194\224\248\229\236 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"����� ����������� ������ �� ������� ���� ��������� 1 ��������� ���� � ����� ���������")
		--SystemNotice(role ,"To open Blurry Blueprint requires at least 1 empty inventory slot")
		UseItemFailed ( role )
		return
	end  	
	local r1 = 0
	local r2 = 0
	local item_ID=GetItemID(Item)
	local Itemnew_ID=2300
	local rad_ID=math.random ( 1, 100 )
	if rad_ID>=50 and rad_ID<=99 then
		Itemnew_ID=2302
	else
		Itemnew_ID=2302
	end
	r1, r2 = MakeItem ( role , Itemnew_ID  , 1 , 4 )
	local Itemnew = GetChaItem ( role , 2 , r2 )


	local rad_energy=math.random ( 1, 100 )
	local energy = 1
	if item_ID==1000 then
		energy=1
	elseif item_ID==1001 then
		if rad_energy<=5 then
			energy=4
		elseif  rad_energy<=30 and rad_energy>=6 then
			energy=3
		else
			energy=2
		end
	elseif item_ID==1002 then
		if rad_energy<=5 then
			energy=6
		elseif  rad_energy<=30 and rad_energy>=6 then
			energy=5
		else
			energy=4
		end
	elseif item_ID==1003 then
		if rad_energy<=5 and Itemnew_ID~=2301 then
			energy=8
		elseif  rad_energy<=30 and rad_energy>=6 then
			energy=7
		else
			energy=6
		end
	end	
	--SystemNotice(role ,"item_ID=="..item_ID)
	--SystemNotice(role ,"rad_energy=="..rad_energy)
	--SystemNotice(role ,"energy=="..energy)

	local final_ID=1849 
	local final_LV=20
	local final_ID1=7622
	local final_ID2=7622
	local final_ID3=7622
	local General = 0  
	local ItemId =3124
	if Itemnew_ID==2300 then
		local STAR_BEGIN=ZHIZAO_Mxcount*(energy-1)/10+1
		local STAR_END=ZHIZAO_Mxcount*energy/10
	--SystemNotice(role ,"STAR_BEGIN=="..STAR_BEGIN)
	--SystemNotice(role ,"STAR_END=="..STAR_END)

		for i = STAR_BEGIN , STAR_END , 1 do 
		    General = ZHIZAO__Rad[ i ] + General		
		end 
		local a = math.random ( 1, General )
		local b = 0
		local d = 0 
		local k = 0 
		local c = -1
		for k = STAR_BEGIN , STAR_END , 1 do
			d = ZHIZAO__Rad[ k ] + b
			if a <= d and a > b then
				c = k
				break 
			end 
			b = d 
		end 
		if c == -1 then
			c =STAR_BEGIN
		end
	--SystemNotice(role ,"c=="..c)

		--local rad_num1=math.random ( 1, 280 )
		final_ID=ZHIZAO_ID[c]
		final_LV=ZHIZAO_LV[c]
		final_ID1=ZHIZAO_ID1[c]
		final_ID2=ZHIZAO_ID2[c]
		final_ID3=ZHIZAO_ID3[c]

	end
	if Itemnew_ID==2301 then
		local STAR_BEGIN=1
		local STAR_END=77
		if energy==1 then
			STAR_BEGIN=1
			STAR_END=77
		elseif energy==2 then
			STAR_BEGIN=78
			STAR_END=166
		elseif energy==3 then
			STAR_BEGIN=167
			STAR_END=278
		elseif energy==4 then
			STAR_BEGIN=279
			STAR_END=434
		elseif energy==5 then
			STAR_BEGIN=435
			STAR_END=596
		elseif energy==6 then
			STAR_BEGIN=597
			STAR_END=732
		elseif energy==7 then
			STAR_BEGIN=733
			STAR_END=871
		elseif energy==8 then
			STAR_BEGIN=895
			STAR_END=902
		end
		--SystemNotice( role ,"energy=="..energy)
		--SystemNotice( role ,"STAR_BEGIN=="..STAR_BEGIN)
		--SystemNotice( role ,"STAR_END=="..STAR_END)

		for i = STAR_BEGIN , STAR_END , 1 do 
		    General = ZHUZAO__Rad[ i ] + General		
		end 
		local a = math.random ( 1, General )
		local b = 0
		local d = 0 
		local k = 0 
		local c = -1
		for k = STAR_BEGIN , STAR_END , 1 do
			d = ZHUZAO__Rad[ k ] + b
			if a <= d and a > b then
				c = k
				break 
				end 
			b = d 
		end 
		if c == -1 then
			c =STAR_BEGIN
		end
		--local rad_num2=math.random ( 1, 906 )
		final_ID=ZHUZAO_ID[c]
		final_LV=ZHUZAO_LV[c]
		final_ID1=ZHUZAO_ID1[c]
		final_ID2=ZHUZAO_ID2[c]
		final_ID3=ZHUZAO_ID3[c]		
		local final_type=GetItemType2(final_ID)
		local check=0
		local i = 0
		for i = 0 , Item_CanJinglian_Num  , 1 do
			if final_type == Item_CanJinglian_ID [i] then
				check=1
			end
		end
		--SystemNotice( role ,"check=="..check)

		if  check==1 then
			local check_rad=math.random ( 1, 1000 )
			if check_rad==1 then
				final_LV=70
			elseif check_rad>=2 and check_rad<=11 then
				final_LV=60
			elseif check_rad>=12 and check_rad<=21 then
				final_LV=50
			elseif check_rad>=22 and check_rad<=221 then
				final_LV=40
			elseif check_rad>=222 and check_rad<=421 then
				final_LV=30
			elseif check_rad>=422 and check_rad<=621 then
				final_LV=20
			else
				final_LV=10				
			end
			if final_LV>70 then
				final_LV=70
			end
			--SystemNotice( role ,"check_energy=="..energy)

			if final_LV~=10 and final_LV~=0 then
				local tmd=(energy-1)*6+final_LV*0.1-1
			--SystemNotice( role ,"tmd=="..tmd)
				final_ID3=TESHU_ID[tmd]
			--SystemNotice( role ,"TESHU_ID[tmd]=="..TESHU_ID[tmd])
			end
		end
	end
	if Itemnew_ID==2302 then
		local STAR_BEGIN=1
		local STAR_END=80
		if energy==1 then
			STAR_BEGIN=1
			STAR_END=7
		elseif energy==2 then
			STAR_BEGIN=8
			STAR_END=12
		elseif energy==3 then
			STAR_BEGIN=13
			STAR_END=17
		elseif energy==4 then
			STAR_BEGIN=18
			STAR_END=26
		elseif energy==5 then
			STAR_BEGIN=27
			STAR_END=31
		elseif energy==6 then
			STAR_BEGIN=32
			STAR_END=36
		else
			STAR_BEGIN=energy+30
			STAR_END=energy+30             
		end
		for i = STAR_BEGIN , STAR_END , 1 do 
		    General = ZHIZAO__Rad[ i ] + General		
		end 
		local a = math.random ( 1, General )
		local b = 0
		local d = 0 
		local k = 0 
		local c = -1
		for k = STAR_BEGIN , STAR_END , 1 do
			d = PENGREN__Rad[ k ] + b
			if a <= d and a > b then
				c = k
				break 
			end 
			b = d 
		end 
		if c == -1 then
			c =STAR_BEGIN
		end
		--local rad_num3=math.random ( 1, 40 )
		final_ID=PENGREN_ID[c]
		final_LV=PENGREN_LV[c]
		final_ID1=PENGREN_ID1[c]
		final_ID2=PENGREN_ID2[c]
		final_ID3=PENGREN_ID3[c]		
	end
	--SystemNotice(role ,"Blueprint level energy=="..energy)

	local star_number=energy*10
	local yingbi_num=math.random ( 10, star_number )
	if energy<=3 then
		SetItemAttr(Itemnew, ITEMATTR_MAXURE, energy )
		SetItemAttr(Itemnew, ITEMATTR_URE, energy )		
	else
		SetItemAttr(Itemnew, ITEMATTR_MAXURE, yingbi_num )
		SetItemAttr(Itemnew, ITEMATTR_URE, energy )
	end
	local sta =math.random ( 1, 10 )
	if Itemnew_ID==2301 then
		sta=sta*0.5
		sta=math.max(1,sta)
	end
	SetItemAttr(Itemnew, ITEMATTR_VAL_STA, sta )
	--SetItemAttr(Itemnew, ITEMATTR_MAXURE, maxure )
	local qulity=math.floor(final_LV*0.1)+100
	SetItemAttr(Itemnew, ITEMATTR_MAXENERGY, qulity )

	local ure=10-final_LV*0.1
	SetItemAttr(Itemnew, ITEMATTR_ENERGY, ure )
	--SetItemAttr(Itemnew, ITEMATTR_URE, ure )

	SetItemAttr(Itemnew, ITEMATTR_VAL_STR, final_ID1 )
	SetItemAttr(Itemnew, ITEMATTR_VAL_CON, final_ID2 )
	SetItemAttr(Itemnew, ITEMATTR_VAL_DEX, final_ID3 )
	SetItemAttr(Itemnew, ITEMATTR_VAL_AGI, final_ID )

	local Num_new = GetItemForgeParam ( Itemnew , 1 )
	local Part2_new = GetNum_Part2 ( Num_new )	
	local Part4_new = GetNum_Part4 ( Num_new )
	local Part6_new = GetNum_Part6 ( Num_new )
	Part2_new = math.random ( 3, 20 ) 
	Part4_new = math.random ( 2, 9 )
	Part6_new = math.random ( 1, 3 )
	Part6_new = Part6_new*math.max(1,(energy-2))
	Num_new = SetNum_Part2 ( Num_new , Part2_new )
	Num_new = SetNum_Part4 ( Num_new , Part4_new )
	Num_new = SetNum_Part6 ( Num_new , Part6_new )
	SetItemForgeParam ( Itemnew , 1 , Num_new )

end 

--Sk_Script_GS
--Sk_Script_NK
--Sk_Script_JQ

--------------------------------------------------------------------------------------------------
--������ "�����"
--------------------------------------------------------------------------------------------------

--����� - �������� (Id 1037)
function Sk_Script_DBs( role , Item ) 							
 	local sk_add = SK_JLTX1  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� - ����� (ID1038)
function Sk_Script_NKs( role , Item ) 							
 	local sk_add = SK_JLTX2  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� - �������� (ID 1039)
function Sk_Script_XZs( role , Item ) 							
 	local sk_add = SK_JLTX3  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� - �������� ����� (ID 1129)
function Sk_Script_JQs( role , Item ) 							
 	local sk_add = SK_JLTX4  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� - ����� (ID 1130)
function Sk_Script_BCs( role , Item ) 							
 	local sk_add = SK_JLTX5  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� - ������������� (ID 1131)
function Sk_Script_BSs( role , Item ) 							
 	local sk_add = SK_JLTX6  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� - ����� (ID 1132)
function Sk_Script_PZs( role , Item ) 							
 	local sk_add = SK_JLTX7  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� - ����� (ID 1133)
function Sk_Script_SZs( role , Item ) 							
 	local sk_add = SK_JLTX8  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--------------------------------------------------------------------------------------------------
--�������� ��� ��������
--------------------------------------------------------------------------------------------------

--������ ������ �������� (ID 1033)
function ItemUse_TunDuiZhiXing( role , Item ) 							
   	local r1 = 0
	local r2 = 0
	r1, r2 = MakeItem ( role , 1034 , 1 , 4 )
	local Itemnew = GetChaItem ( role , 2 , r2 )
	--SetItemAttr(Itemnew, ITEMATTR_ENERGY, 100 )
	--SetItemAttr(Itemnew, ITEMATTR_MAXENERGY, 201000 )
	SetItemAttr(Itemnew, ITEMATTR_URE, 100 )
	SetItemAttr(Itemnew, ITEMATTR_MAXURE, 30100 )
end 

--����-��������� ������� (ID 1128)
function ItemUse_WeiXing( role , Item )
	local statelv = 1
	local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
	if ChaStateLv > 0 then
		PopupNotice ( role , "������ ����� ������� ��� �������! " )
		UseItemFailed ( role )
		return
	end
	local lv_star = GetChaAttr( role , ATTR_LV) 
	if lv_star > 150 then
		PopupNotice( role , "����� ������������ ������ ������� ���� 150 ������. " )
		UseItemFailed ( role )
		return
	end
	local statetime = 360
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBJYGZ , statelv , statetime )
		EffectPanel_Add(role, "STATE_SBJYGZ", statelv, "n1198", EffectPanel_TimeConvertor(statetime))
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBJYGZ , statelv , statetime )
		EffectPanel_Add(role, "STATE_SBJYGZ", statelv, "n1198", EffectPanel_TimeConvertor(statetime))
	end
    PlayEffect (role, 943 )      -- ���������� ����������� ������ ��� �������� �������
end


--------------------------------------------------------------------------------------------------
--������ ������ ��� ���
--------------------------------------------------------------------------------------------------

--������������ ��� ���. ��. (ID 1055)
function ItemUse_JLZhiZ_CJ ( role , Item , Item_Traget )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )
		local SkillType = 1
		local SkillNum = 13

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
			if Check == 1 then
				SystemNotice(role , "\212\229\255 \243\230\229 \232\236\229\229\242 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "��� ��� ����� ������ ������" )
				--SystemNotice(role , "have target skill, usage failed" )
				UseItemFailed ( role )
			else
				AddElfSkill ( Item_Traget , SkillType , SkillNum )
			end
		end
end

--������������ ��� �����. ��. (ID 1056)
function ItemUse_JLZhiZ_ZJ ( role , Item , Item_Traget )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )
		local SkillType = 2
		local SkillNum = 13

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
			if Check == 1 then
				SystemNotice(role , "\212\229\255 \243\230\229 \232\236\229\229\242 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "��� ��� ����� ������ ������" )
				--SystemNotice(role , "have target skill, usage failed" )
				UseItemFailed ( role )
			else
				AddElfSkill ( Item_Traget , SkillType , SkillNum )
			end
		end
end

--������������ ��� ���. ��. (ID 1057)
function ItemUse_JLZhiZ_GJ ( role , Item , Item_Traget )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )
		local SkillType = 3
		local SkillNum = 13

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
			if Check == 1 then
				SystemNotice(role , "\212\229\255 \243\230\229 \232\236\229\229\242 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "��� ��� ����� ������ ������" )
				--SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
				AddElfSkill ( Item_Traget , SkillType , SkillNum )
			end
		end
end

--������������ ��� ���. ��. (ID 1058)
function ItemUse_JLZhuZ_CJ ( role , Item , Item_Traget )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )
		local SkillType = 1
		local SkillNum = 14

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
			if Check == 1 then
				SystemNotice(role , "\212\229\255 \243\230\229 \232\236\229\229\242 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "��� ��� ����� ������ ������" )
				--SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
				AddElfSkill ( Item_Traget , SkillType , SkillNum )
			end
		end
end

--������������ ��� �����. ��. (ID 1059)
function ItemUse_JLZhuZ_ZJ ( role , Item , Item_Traget )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )
		local SkillType = 2
		local SkillNum = 14

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
			if Check == 1 then
				SystemNotice(role , "\212\229\255 \243\230\229 \232\236\229\229\242 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "��� ��� ����� ������ ������" )
				--SystemNotice(role , "have target skill, usage failed" )
				UseItemFailed ( role )
			else
				AddElfSkill ( Item_Traget , SkillType , SkillNum )
			end
		end
end

--������� ��� ���. ��. (ID 1060)
function ItemUse_JLZhuZ_GJ ( role , Item , Item_Traget )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )
		local SkillType = 3
		local SkillNum = 14

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
			if Check == 1 then
				SystemNotice(role , "\212\229\255 \243\230\229 \232\236\229\229\242 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "��� ��� ����� ������ ������" )
				--SystemNotice(role , "have target skill, usage failed" )
				UseItemFailed ( role )
			else
				AddElfSkill ( Item_Traget , SkillType , SkillNum )
			end
		end
end

--������ ������ ��� ��� ���������� (ID 1061)
function ItemUse_JLFenJ_CJ ( role , Item , Item_Traget )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )
		local SkillType = 1
		local SkillNum = 15

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
			if Check == 1 then
				SystemNotice(role , "\212\229\255 \243\230\229 \232\236\229\229\242 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "��� ��� ����� ������ ������" )
				--SystemNotice(role , "have target skill, usage failed" )
				UseItemFailed ( role )
			else
				AddElfSkill ( Item_Traget , SkillType , SkillNum )
			end
		end
end

--������� ������ ������ ��� (ID 1062)
function ItemUse_JLFenJ_ZJ ( role , Item , Item_Traget )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )
		local SkillType = 2
		local SkillNum = 15

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
			if Check == 1 then
				SystemNotice(role , "\212\229\255 \243\230\229 \232\236\229\229\242 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "��� ��� ����� ������ ������" )
				--SystemNotice(role , "have target skill, usage failed" )
				UseItemFailed ( role )
			else
				AddElfSkill ( Item_Traget , SkillType , SkillNum )
			end
		end
end

--������ ��� ���. ��. (ID 1063)
function ItemUse_JLFenJ_GJ ( role , Item , Item_Traget )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )
		local SkillType = 3
		local SkillNum = 15

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
			if Check == 1 then
				SystemNotice(role , "\212\229\255 \243\230\229 \232\236\229\229\242 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "��� ��� ����� ������ ������" )
				--SystemNotice(role , "have target skill, usage failed" )
				UseItemFailed ( role )
			else
				AddElfSkill ( Item_Traget , SkillType , SkillNum )
			end
		end
end

--��������� ���. ��. ��� ������ ��� (ID 1064)
function ItemUse_JLPengR_CJ ( role , Item , Item_Traget )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )
		local SkillType = 1
		local SkillNum = 16

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
			if Check == 1 then
				SystemNotice(role , "\212\229\255 \243\230\229 \232\236\229\229\242 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "��� ��� ����� ������ ������" )
				--SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
				AddElfSkill ( Item_Traget , SkillType , SkillNum )
			end
		end
end

--������� ��������� ��� (ID 1065)
function ItemUse_JLPengR_ZJ ( role , Item , Item_Traget )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )
		local SkillType = 2
		local SkillNum = 16

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
			if Check == 1 then
				SystemNotice(role , "\212\229\255 \243\230\229 \232\236\229\229\242 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "��� ��� ����� ������ ������" )
				--SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
				AddElfSkill ( Item_Traget , SkillType , SkillNum )
			end
		end
end

--��������� ������� ������ ��� ������ ��� (ID 1066)
function ItemUse_JLPengR_GJ ( role , Item , Item_Traget )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )
		local SkillType = 3
		local SkillNum = 16

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
			if Check == 1 then
				SystemNotice(role , "\212\229\255 \243\230\229 \232\236\229\229\242 \228\224\237\237\238\229 \243\236\229\237\232\229" ) 
				--SystemNotice(role , "��� ��� ����� ������ ������" )
				--SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
				AddElfSkill ( Item_Traget , SkillType , SkillNum )
			end
		end
end

--------------------------------------------------------------------------------------------------
--������ �����
--------------------------------------------------------------------------------------------------

--������ ����� (ID 1134)
function ItemUse_FightingBox( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		SystemNotice(role ,"\210\240\229\225\243\229\242\241\255 2 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224 \226 \194\224\248\229\236 \232\237\226\229\237\242\224\240\229, \247\242\238\225\251 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \213\224\238\241\224")
		--SystemNotice(role ,"��������� 2 ��������� ����� � ����� ���������, ����� ������� ������ �����")
		--SystemNotice(role ,"You need at least 2 empty inventory slots to open the Chaos Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2610  , 1 , 4 )
	local rad = math.random ( 1, 3 )
	if rad ==1 then
	GiveItem ( role , 0 , 1124  , 1 , 15 )	
	end
	
	if rad ==2 then
	GiveItem ( role , 0 , 1125  , 1 , 15 )	
	end
	
	if rad ==3 then
	GiveItem ( role , 0 , 1126  , 1 , 15 )	
	end
end

--------------------------------------------------------------------------------------------------
--���������
--------------------------------------------------------------------------------------------------

--������� ����� ������ (ID 4019)
function ItemUse_XUEYU( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local statelv = 1
	local ChaStateLv = GetChaStateLv ( role , STATE_XUEYU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "\194\251 \243\230\229 \232\241\239\238\235\252\231\238\226\224\235\232 \234\243\235\232\237\224\240\232\254 \225\238\235\229\229 \226\251\241\238\234\238\227\238 \243\240\238\226\237\255. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "�� ��� ������������ ��������� ����� �������� ������. ����������, ���������� �����" )
		--SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 900
	AddState( role , role , STATE_XUEYU , statelv , statetime )
end 

--�������� � �������� (ID 4020)
function ItemUse_CUIZHU( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role ) 
		return 
	end 
	local statelv = 2
	local ChaStateLv = GetChaStateLv ( role , STATE_XUEYU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "\194\251 \243\230\229 \232\241\239\238\235\252\231\238\226\224\235\232 \234\243\235\232\237\224\240\232\254 \225\238\235\229\229 \226\251\241\238\234\238\227\238 \243\240\238\226\237\255. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "�� ��� ������������ ��������� ����� �������� ������. ����������, ���������� �����" )
		--SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 600
	AddState( role , role , STATE_XUEYU , statelv , statetime )
end 

--������� ����-��� (ID4021)
function ItemUse_HUIXIANG( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local statelv = 3
	local ChaStateLv = GetChaStateLv ( role , STATE_XUEYU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "\194\251 \243\230\229 \232\241\239\238\235\252\231\238\226\224\235\232 \234\243\235\232\237\224\240\232\254 \225\238\235\229\229 \226\251\241\238\234\238\227\238 \243\240\238\226\237\255. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "�� ��� ������������ ��������� ����� �������� ������. ����������, ���������� �����" )
		--SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 600
	AddState( role , role , STATE_XUEYU , statelv , statetime )
end 

--��� �� ������ (ID 4022)
function ItemUse_YINGYUE( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local statelv = 4
	local ChaStateLv = GetChaStateLv ( role , STATE_XUEYU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "\194\251 \243\230\229 \232\241\239\238\235\252\231\238\226\224\235\232 \234\243\235\232\237\224\240\232\254 \225\238\235\229\229 \226\251\241\238\234\238\227\238 \243\240\238\226\237\255. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "�� ��� ������������ ��������� ����� �������� ������. ����������, ���������� �����" )
		--SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime =480
	AddState( role , role , STATE_XUEYU , statelv , statetime )
end 

--��� �� ������� ������ (ID 4023)
function ItemUse_LANGBEI( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local statelv =5
	local ChaStateLv = GetChaStateLv ( role , STATE_XUEYU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "\194\251 \243\230\229 \232\241\239\238\235\252\231\238\226\224\235\232 \234\243\235\232\237\224\240\232\254 \225\238\235\229\229 \226\251\241\238\234\238\227\238 \243\240\238\226\237\255. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "�� ��� ������������ ��������� ����� �������� ������. ����������, ���������� �����" )
		--SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 480
	AddState( role , role , STATE_XUEYU , statelv , statetime )
end 

--����������� ����� (ID 4024)
function ItemUse_XIAOXIAO( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local statelv = 6
	local ChaStateLv = GetChaStateLv ( role , STATE_XUEYU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "\194\251 \243\230\229 \232\241\239\238\235\252\231\238\226\224\235\232 \234\243\235\232\237\224\240\232\254 \225\238\235\229\229 \226\251\241\238\234\238\227\238 \243\240\238\226\237\255. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "�� ��� ������������ ��������� ����� �������� ������. ����������, ���������� �����" )
		--SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 360
	AddState( role , role , STATE_XUEYU , statelv , statetime )
end 

--������� ����� ����-����� (ID 4025)
function ItemUse_HUPI( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local statelv =7
	local ChaStateLv = GetChaStateLv ( role , STATE_XUEYU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "\194\251 \243\230\229 \232\241\239\238\235\252\231\238\226\224\235\232 \234\243\235\232\237\224\240\232\254 \225\238\235\229\229 \226\251\241\238\234\238\227\238 \243\240\238\226\237\255. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "�� ��� ������������ ��������� ����� �������� ������. ����������, ���������� �����" )
		--SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 300
	AddState( role , role , STATE_XUEYU , statelv , statetime )
end 

--��� � �����-������� (ID 4026)
function ItemUse_YINJIAO( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )  
		UseItemFailed ( role ) 
		return 
	end 
	local statelv = 8
	local ChaStateLv = GetChaStateLv ( role , STATE_XUEYU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "\194\251 \243\230\229 \232\241\239\238\235\252\231\238\226\224\235\232 \234\243\235\232\237\224\240\232\254 \225\238\235\229\229 \226\251\241\238\234\238\227\238 \243\240\238\226\237\255. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "�� ��� ������������ ��������� ����� �������� ������. ����������, ���������� �����" )
		--SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 180
	AddState( role , role , STATE_XUEYU , statelv , statetime )
end 

--����� ��� ������������ ������� (ID 4027)
function ItemUse_TAOTU( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )  
		UseItemFailed ( role ) 
		return 
	end 
	local statelv = 9
	local ChaStateLv = GetChaStateLv ( role , STATE_XUEYU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "\194\251 \243\230\229 \232\241\239\238\235\252\231\238\226\224\235\232 \234\243\235\232\237\224\240\232\254 \225\238\235\229\229 \226\251\241\238\234\238\227\238 \243\240\238\226\237\255. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "�� ��� ������������ ��������� ����� �������� ������. ����������, ���������� �����" )
		--SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 180
	AddState( role , role , STATE_XUEYU , statelv , statetime )
end 

--������� �� �������� �������� (ID 4028)
function ItemUse_BAIWANG( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )  
		UseItemFailed ( role ) 
		return 
	end 
	local statelv = 10
	local ChaStateLv = GetChaStateLv ( role , STATE_XUEYU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "\194\251 \243\230\229 \232\241\239\238\235\252\231\238\226\224\235\232 \234\243\235\232\237\224\240\232\254 \225\238\235\229\229 \226\251\241\238\234\238\227\238 \243\240\238\226\237\255. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "�� ��� ������������ ��������� ����� �������� ������. ����������, ���������� �����" )
		--SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime =60
	AddState( role , role , STATE_XUEYU , statelv , statetime )
end 

--������ ������� (ID 1078)
function ItemUse_MANTOU( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )  
		UseItemFailed ( role ) 
		return 
	end 
	local hp = GetChaAttr( role , ATTR_HP ) 
	local hp_resume = 200 
	hp = hp + hp_resume 
	local mxhp = GetChaAttr( role , ATTR_MXHP) 
	if hp > mxhp then 
		 hp = mxhp 
	 end 
	SetCharaAttr(hp, role, ATTR_HP) 
	local statelv = 1
	local ChaStateLv = GetChaStateLv ( role , STATE_MANTOU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "\194\251 \243\230\229 \232\241\239\238\235\252\231\238\226\224\235\232 \234\243\235\232\237\224\240\232\254 \225\238\235\229\229 \226\251\241\238\234\238\227\238 \243\240\238\226\237\255. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "�� ��� ������������ ��������� ����� �������� ������. ����������, ���������� �����" )
		--SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 900
	AddState( role , role , STATE_MANTOU , statelv , statetime )
end 

--������� (ID 1079)
function ItemUse_BAOZI( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local hp = GetChaAttr( role , ATTR_HP ) 
	local hp_resume = 400 
	hp = hp + hp_resume 
	local mxhp = GetChaAttr( role , ATTR_MXHP) 
	if hp > mxhp then 
		 hp = mxhp 
	 end 
	SetCharaAttr(hp, role, ATTR_HP) 
	local statelv = 2
	local ChaStateLv = GetChaStateLv ( role , STATE_MANTOU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "\194\251 \243\230\229 \232\241\239\238\235\252\231\238\226\224\235\232 \234\243\235\232\237\224\240\232\254 \225\238\235\229\229 \226\251\241\238\234\238\227\238 \243\240\238\226\237\255. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "�� ��� ������������ ��������� ����� �������� ������. ����������, ���������� �����" )
		--SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime =600
	AddState( role , role , STATE_MANTOU , statelv , statetime )
end 

--������� (ID 1080)
function ItemUse_DABING( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local hp = GetChaAttr( role , ATTR_HP ) 
	local hp_resume = 600 
	hp = hp + hp_resume 
	local mxhp = GetChaAttr( role , ATTR_MXHP) 
	if hp > mxhp then 
		 hp = mxhp 
	 end 
	SetCharaAttr(hp, role, ATTR_HP) 
	local statelv = 3
	local ChaStateLv = GetChaStateLv ( role , STATE_MANTOU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "\194\251 \243\230\229 \232\241\239\238\235\252\231\238\226\224\235\232 \234\243\235\232\237\224\240\232\254 \225\238\235\229\229 \226\251\241\238\234\238\227\238 \243\240\238\226\237\255. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "�� ��� ������������ ��������� ����� �������� ������. ����������, ���������� �����" )
		--SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 420
	AddState( role , role , STATE_MANTOU , statelv , statetime )
end 

--����������� ������� (ID 1082)
function ItemUse_YOUTIAO( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local hp = GetChaAttr( role , ATTR_HP ) 
	local hp_resume = 800 
	hp = hp + hp_resume 
	local mxhp = GetChaAttr( role , ATTR_MXHP) 
	if hp > mxhp then 
		 hp = mxhp 
	 end 
	SetCharaAttr(hp, role, ATTR_HP) 
	local statelv = 4
	local ChaStateLv = GetChaStateLv ( role , STATE_MANTOU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "\194\251 \243\230\229 \232\241\239\238\235\252\231\238\226\224\235\232 \234\243\235\232\237\224\240\232\254 \225\238\235\229\229 \226\251\241\238\234\238\227\238 \243\240\238\226\237\255. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "�� ��� ������������ ��������� ����� �������� ������. ����������, ���������� �����" )
		--SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime =300
	AddState( role , role , STATE_MANTOU , statelv , statetime )
end 

--������������� ������ (ID 1083)
function ItemUse_CHUNJUAN( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )  
		UseItemFailed ( role ) 
		return 
	end 
	local hp = GetChaAttr( role , ATTR_HP ) 
	local hp_resume = 1500000 
	hp = hp + hp_resume 
	local mxhp = GetChaAttr( role , ATTR_MXHP) 
	if hp > mxhp then 
		 hp = mxhp 
	 end 
	SetCharaAttr(hp, role, ATTR_HP) 
	local statelv = 5
	local ChaStateLv = GetChaStateLv ( role , STATE_MANTOU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "\194\251 \243\230\229 \232\241\239\238\235\252\231\238\226\224\235\232 \234\243\235\232\237\224\240\232\254 \225\238\235\229\229 \226\251\241\238\234\238\227\238 \243\240\238\226\237\255. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "�� ��� ������������ ��������� ����� �������� ������. ����������, ���������� �����" )
		--SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 120
	AddState( role , role , STATE_MANTOU , statelv , statetime )
end 

--���� ���� (ID 1084)
function ItemUse_NVER( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )  
		UseItemFailed ( role ) 
		return 
	end 
	local sp = GetChaAttr( role , ATTR_SP ) 
	local sp_resume = 100 
	sp = sp + sp_resume 
	local mxsp = GetChaAttr( role , ATTR_MXSP) 
	if sp > mxsp then 
		 sp = mxsp 
	 end 
	SetCharaAttr(sp, role, ATTR_SP) 
	local statelv = 1
	local ChaStateLv = GetChaStateLv ( role , STATE_NVER )
	if ChaStateLv > statelv then
		SystemNotice ( role , "\194\251 \243\230\229 \232\241\239\238\235\252\231\238\226\224\235\232 \234\243\235\232\237\224\240\232\254 \225\238\235\229\229 \226\251\241\238\234\238\227\238 \243\240\238\226\237\255. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "�� ��� ������������ ��������� ����� �������� ������. ����������, ���������� �����" )
		--SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 900
	AddState( role , role , STATE_NVER , statelv , statetime )
end 

--���� ������ (ID 1085)
function ItemUse_ZHUANGYUAN( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local sp = GetChaAttr( role , ATTR_SP ) 
	local sp_resume = 200 
	sp = sp + sp_resume 
	local mxsp = GetChaAttr( role , ATTR_MXSP) 
	if sp > mxsp then 
		 sp = mxsp 
	 end 
	SetCharaAttr(sp, role, ATTR_SP) 
	local statelv = 2
	local ChaStateLv = GetChaStateLv ( role , STATE_NVER )
	if ChaStateLv > statelv then
		SystemNotice ( role , "\194\251 \243\230\229 \232\241\239\238\235\252\231\238\226\224\235\232 \234\243\235\232\237\224\240\232\254 \225\238\235\229\229 \226\251\241\238\234\238\227\238 \243\240\238\226\237\255. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "�� ��� ������������ ��������� ����� �������� ������. ����������, ���������� �����" )
		--SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 600
	AddState( role , role , STATE_NVER , statelv , statetime )
end 

--��������� ���� (ID 1088)
function ItemUse_DUKANG( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local sp = GetChaAttr( role , ATTR_SP ) 
	local sp_resume = 300 
	sp = sp + sp_resume 
	local mxsp = GetChaAttr( role , ATTR_MXSP) 
	if sp > mxsp then 
		 sp = mxsp 
	 end 
	SetCharaAttr(sp, role, ATTR_SP) 
	local statelv = 3
	local ChaStateLv = GetChaStateLv ( role , STATE_NVER )
	if ChaStateLv > statelv then
		SystemNotice ( role , "\194\251 \243\230\229 \232\241\239\238\235\252\231\238\226\224\235\232 \234\243\235\232\237\224\240\232\254 \225\238\235\229\229 \226\251\241\238\234\238\227\238 \243\240\238\226\237\255. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "�� ��� ������������ ��������� ����� �������� ������. ����������, ���������� �����" )
		--SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 420
	AddState( role , role , STATE_NVER , statelv , statetime )
end 

--���� ��� (ID 1087)
function ItemUse_MAOTAI( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local sp = GetChaAttr( role , ATTR_SP ) 
	local sp_resume = 400 
	sp = sp + sp_resume 
	local mxsp = GetChaAttr( role , ATTR_MXSP) 
	if sp > mxsp then 
		 sp = mxsp 
	 end 
	SetCharaAttr(sp, role, ATTR_SP) 
	local statelv = 4
	local ChaStateLv = GetChaStateLv ( role , STATE_NVER )
	if ChaStateLv > statelv then
		SystemNotice ( role , "\194\251 \243\230\229 \232\241\239\238\235\252\231\238\226\224\235\232 \234\243\235\232\237\224\240\232\254 \225\238\235\229\229 \226\251\241\238\234\238\227\238 \243\240\238\226\237\255. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "�� ��� ������������ ��������� ����� �������� ������. ����������, ���������� �����" )
		--SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 300
	AddState( role , role , STATE_NVER , statelv , statetime )
end 

--���� � ��������� (ID 1089)
function ItemUse_RENSHEN( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local sp = GetChaAttr( role , ATTR_SP ) 
	local sp_resume = 500 
	sp = sp + sp_resume 
	local mxsp = GetChaAttr( role , ATTR_MXSP) 
	if sp > mxsp then 
		 sp = mxsp 
	 end 
	SetCharaAttr(sp, role, ATTR_SP) 
	local statelv = 5
	local ChaStateLv = GetChaStateLv ( role , STATE_NVER )
	if ChaStateLv > statelv then
		SystemNotice ( role , "\194\251 \243\230\229 \232\241\239\238\235\252\231\238\226\224\235\232 \234\243\235\232\237\224\240\232\254 \225\238\235\229\229 \226\251\241\238\234\238\227\238 \243\240\238\226\237\255. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "�� ��� ������������ ��������� ����� �������� ������. ����������, ���������� �����" )
		--SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 180
	AddState( role , role , STATE_NVER , statelv , statetime )
end 

--����� �� �������� ����� (ID 1090)
function ItemUse_HUGU( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local sp = GetChaAttr( role , ATTR_SP ) 
	local sp_resume = 600 
	sp = sp + sp_resume 
	local mxsp = GetChaAttr( role , ATTR_MXSP) 
	if sp > mxsp then 
		 sp = mxsp 
	 end 
	SetCharaAttr(sp, role, ATTR_SP) 
	local statelv = 6
	local ChaStateLv = GetChaStateLv ( role , STATE_NVER )
	if ChaStateLv > statelv then
		SystemNotice ( role , "\194\251 \243\230\229 \232\241\239\238\235\252\231\238\226\224\235\232 \234\243\235\232\237\224\240\232\254 \225\238\235\229\229 \226\251\241\238\234\238\227\238 \243\240\238\226\237\255. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229" )
		--SystemNotice ( role , "�� ��� ������������ ��������� ����� �������� ������. ����������, ���������� �����" )
		--SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 120
	AddState( role , role , STATE_NVER , statelv , statetime )
end 

--------------------------------------------------------------------------------------------------
--�������
--------------------------------------------------------------------------------------------------

--������ � ������������ ����������� (ID 2224)
function ItemUse_MOLIBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet < 4 then
		SystemNotice(role ,"\194\224\236 \237\243\230\237\238 4 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224 \226 \194\224\248\229\236 \232\237\226\229\237\242\224\240\229, \247\242\238\225\251 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
		--SystemNotice(role ,"��� ����� 4 ��������� ����� � ����� ���������, ����� ������� ������")
		--SystemNotice(role ,"You need at least 4 empty inventory slots to open the Chest")
		UseItemFailed ( role )
		return
	end
	local rad = math.random ( 1, 12 )
	if rad == 1 then
	GiveItem ( role , 0 , 5107  , 1 , 4 ) 
	GiveItem ( role , 0 , 5108  , 1 , 4 ) 
	GiveItem ( role , 0 , 5109  , 1 , 4 ) 
	elseif rad == 2 then
	GiveItem ( role , 0 , 5111  , 1 , 4 ) 
	GiveItem ( role , 0 , 5112  , 1 , 4 ) 
	GiveItem ( role , 0 , 5113  , 1 , 4 ) 
	elseif rad == 3 then
	GiveItem ( role , 0 , 5115  , 1 , 4 ) 
	GiveItem ( role , 0 , 5116  , 1 , 4 ) 
	GiveItem ( role , 0 , 5117  , 1 , 4 ) 
	elseif rad == 4 then
	GiveItem ( role , 0 , 5119  , 1 , 4 ) 
	GiveItem ( role , 0 , 5120  , 1 , 4 ) 
	GiveItem ( role , 0 , 5121  , 1 , 4 ) 
	elseif rad == 5 then
	GiveItem ( role , 0 , 5123  , 1 , 4 ) 
	GiveItem ( role , 0 , 5124  , 1 , 4 ) 
	GiveItem ( role , 0 , 5125  , 1 , 4 )
	elseif rad == 6 then
	GiveItem ( role , 0 , 5127  , 1 , 4 ) 
	GiveItem ( role , 0 , 5128  , 1 , 4 ) 
	GiveItem ( role , 0 , 5129  , 1 , 4 )
	elseif rad == 7 then
	GiveItem ( role , 0 , 5130  , 1 , 4 ) 
	GiveItem ( role , 0 , 5131  , 1 , 4 ) 
	GiveItem ( role , 0 , 5132  , 1 , 4 )
	GiveItem ( role , 0 , 5133  , 1 , 4 )
	elseif rad == 8 then
	GiveItem ( role , 0 , 5134  , 1 , 4 ) 
	GiveItem ( role , 0 , 5135  , 1 , 4 ) 
	GiveItem ( role , 0 , 5136  , 1 , 4 )
	GiveItem ( role , 0 , 5137  , 1 , 4 )
	elseif rad == 9 then
	GiveItem ( role , 0 , 5138  , 1 , 4 ) 
	GiveItem ( role , 0 , 5139  , 1 , 4 ) 
	GiveItem ( role , 0 , 5140  , 1 , 4 )
	GiveItem ( role , 0 , 5141  , 1 , 4 )
	elseif rad == 10 then
	GiveItem ( role , 0 , 5143  , 1 , 4 ) 
	GiveItem ( role , 0 , 5144  , 1 , 4 ) 
	GiveItem ( role , 0 , 5145  , 1 , 4 ) 
	elseif rad == 11 then
	GiveItem ( role , 0 , 5147  , 1 , 4 ) 
	GiveItem ( role , 0 , 5148  , 1 , 4 ) 
	GiveItem ( role , 0 , 5149  , 1 , 4 )
	elseif rad == 12 then
	GiveItem ( role , 0 , 5151  , 1 , 4 ) 
	GiveItem ( role , 0 , 5152  , 1 , 4 ) 
	GiveItem ( role , 0 , 5153  , 1 , 4 )
	end
	--local cha_name = GetChaDefaultName ( role ) 
	--local message = cha_name.." \238\242\234\240\251\226\224\229\242 \209\243\237\228\243\234 \241 \241\238\226\240\229\236\229\237\237\251\236\232 \243\234\240\224\248\229\237\232\255\236\232 \232 \239\238\235\243\247\224\229\242 1 \237\224\225\238\240 \243\234\240\224\248\229\237\232\233"   
	----local message = cha_name.." ��������� ������ � ������������ ����������� � �������� 1 ����� ���������" 
	----local message = cha_name.." opens Apparel Chest and obtain 1 apparel set" 
	--Notice ( message )
end

--������ ������� (ID 0024)
function ItemUse_IDBOX(role, Item )
	local lv = GetChaAttr(role, ATTR_LV)
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	local cha_name = GetChaDefaultName ( role ) 
	local count = 1
	
	if lv < 60 then
		SystemNotice( role ,"\194\224\248 \243\240\238\226\229\237\252 \237\232\230\229 \247\229\236 60. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \239\240\229\228\236\229\242!")
		--SystemNotice( role ,"��� ������� ���� ��� 60. ���������� ������������ �������!")
		--SystemNotice( role ,"Currently lower then Lv 60. Item usage failed!")
		UseItemFailed ( role )	
	else
		SystemNotice(role,"\221\226\229\237\242 \231\224\234\238\237\247\232\235\241\255, \209\239\224\241\232\225\238 \194\224\236 \231\224 \243\247\224\241\242\232\229. \207\238\230\224\235\243\233\241\242\224, \231\224\233\228\232\242\229 \237\224 \244\238\240\243\236 \194\224\248\229\227\238 \241\229\240\226\229\240\224, \247\242\238\225\251 \243\231\237\224\242\252 \225\235\232\230\224\233\248\232\229 \241\238\225\251\242\232\255!")
		--SystemNotice(role,"����� ����������, ������� ��� �� �������. ����������, ������� �� ����� ������ �������, ����� ������ ��������� �������!")
		--SystemNotice(role,"Event have ended, Thank You for your participation. Please refer to Tales of Pirates official website for future events!")
	end
end 

--����� ����� ����� (ID 2816)
function ItemUse_HonorPoint (role, Item )
	local HonorBook_Num = 0
	local HonorBook_Num = CheckBagItem( role,3849 )
		if HonorBook_Num < 1 then
		SystemNotice( role , "\211 \194\224\241 \237\229\242 \204\229\228\224\235\232 \206\242\226\224\227\232")
		--SystemNotice( role , "� ��� ��� ������ ������")
		--SystemNotice( role , "You do not have Mark of Honor")
		return 0
		end
	local Book2 =  GetChaItem2 ( role , 2 , 3849 )
	local HonorPoint=GetItemAttr ( Book2 , ITEMATTR_VAL_STR)
	
	local HonorPoint_X=HonorPoint+5
	SetItemAttr ( Book2 , ITEMATTR_VAL_STR,HonorPoint_X)
	
end

--����� ������� ����� (ID 2951)
function ItemUse_FightingPoint (role, Item )
	local HonorBook_Num = 0
	local HonorBook_Num = CheckBagItem( role,3849 )
		if HonorBook_Num < 1 then
		SystemNotice( role , "\211 \194\224\241 \237\229\242 \204\229\228\224\235\232 \206\242\226\224\227\232")
		--SystemNotice( role , "� ��� ��� ������ ������")
		--SystemNotice( role , "You do not have Mark of Honor")
		return 0
		end
	local Book2 =  GetChaItem2 ( role , 2 , 3849 )
	local FightingPoint=GetItemAttr ( Book2 , ITEMATTR_MAXENERGY)
	
	local FightingPoint_X=FightingPoint+100
	SetItemAttr ( Book2 , ITEMATTR_MAXENERGY,FightingPoint_X)
	
end

--------------------------------------------------------------------------------------------------
--���������
--------------------------------------------------------------------------------------------------

--������� ��������� ���� (ID 2895)
function ItemUse_MWHJ ( role , Item )  
	local el_exp = GetChaAttr(role, ATTR_CEXP)
	local exp1=el_exp
	local charLv=Lv ( role )
	local exp_resume = 5000
	local	exp_resume_1= 100
	el_exp = el_exp + exp_resume
	 if charLv>=80 then	
		el_exp = exp1 + exp_resume_1
	end
	SetCharaAttr(el_exp, role, ATTR_CEXP) 
end 

--����������� ���� (ID 2898)
function ItemUse_SDDC ( role , Item )
	local Cha_Boat = 0
	local charLv=Lv ( role )
	local dif_exp_one = DEXP[charLv+1]
	local dif_exp_three = DEXP[charLv+3]
	local dif_exp_five = DEXP[charLv+5]
	local Exp_star=GetChaAttr (  role , ATTR_CEXP )
	local dif_exp_half = (DEXP[charLv+1] - DEXP[charLv])*0.5 +  Exp_star +10
	local dif_exp_thalf = (DEXP[charLv+1] - DEXP[charLv])*0.3  +  Exp_star + 10
	local dif_exp_thalf_b = dif_exp_thalf - DEXP[charLv+1]
	local dif_exp_thalf_c = (DEXP[charLv+1] - DEXP[charLv])*0.01+Exp_star
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role )
		return
	elseif charLv>=1 and charLv<=9 then
		SetChaAttrI( role , ATTR_CEXP , dif_exp_five )
	elseif charLv>=10 and charLv<=29 then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_three )
	elseif charLv>=30 and charLv<=59 then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_one )
	elseif charLv>=60 and charLv<=75 then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_half )
	elseif charLv>=76 and charLv<=85 and charLv~=79  then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf )
	elseif charLv==79 and dif_exp_thalf_b<=0 then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf )
	elseif charLv==79 and dif_exp_thalf_b>0 then 
			dif_exp_thalf = dif_exp_thalf_b*0.02 + DEXP[charLv+1]
			SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf )
	elseif charLv>=86 then
		SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf_c )
		--SystemNotice( role , "\200\227\240\238\234\232 \226\251\248\229 86 \243\240\238\226\237\255 \225\243\228\243\242 \239\238\235\243\247\224\242\252 1% \238\239\251\242\224 \239\240\232 \232\241\239\238\235\252\231\238\226\224\237\232\232" )
		----SystemNotice( role , "������ ���� 86 ������ ����� �������� 1% ����� ��� �������������" )
		----SystemNotice( role , "Players above Lv 86 will obtain 1% experience upon usage" )
	end
end

--������ ��������� ������ (ID 2900)
function ItemUse_GWZHQ ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <=3 then
		SystemNotice(role ,"\205\229 \245\226\224\242\224\229\242 \241\226\238\225\238\228\237\251\245 \241\235\238\242\238\226 \226 \194\224\248\229\236 \232\237\226\229\237\242\224\240\229. \194\224\236 \237\243\230\237\238 4 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \209\226\232\242\238\234 \239\240\232\231\226\224\237\232\255 \247\243\228\232\249\224")
		--SystemNotice(role ,"�� ������� ��������� ������ � ����� ���������. ��� ����� 4 ��������� �����. ���������� ������������ ������ ��������� ������")
		--SystemNotice(role ,"Not enough slots. You need at least 4 empty slots. Failed to open Posh Christmas Box")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2888  , 1 , 4) 
	GiveItem ( role , 0 , 2889  , 1 , 4)
	GiveItem ( role , 0 , 2890  , 1 , 4)
	GiveItem ( role , 0 , 2891  , 1 , 4)
end

--������ ������ ������� (ID 2888)
function ItemUse_HJZHQ ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \227\238\228\232\242\241\255 \234 \232\241\239\238\235\252\231\238\226\224\237\232\254 \237\224 \236\238\240\229." )
		--SystemNotice( role , "�� ������� � ������������� �� ����." )
		--SystemNotice( role , "Not usable on the sea." )
		UseItemFailed ( role )
		return
	end
	local pet_num = GetPetNum(role)
	if pet_num >= 5 then
		SystemNotice( role , "\199\224 \240\224\231 \236\224\234\241\232\236\243\236 \236\238\230\237\238 \226\251\231\226\224\242\252 5 \240\243\247\237\251\245 \230\232\226\238\242\237\251\245. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229!" )
		--SystemNotice( role , "�� ��� �������� ����� ������� 5 ������ ��������. ����������, ���������� �����!" )
		--SystemNotice( role , "Max of limit of 5 pets reached. Please try again later!" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	x_resume = 5
	y_resume = 5
	x = x + x_resume
	y = y + y_resume
	local MonsterID =930
	local Refresh = 1800
	local life = 1800000
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaHost(new,role)
	SetChaLifeTime( new, life )
	SetChaTarget(new, role)
	PlayEffect( new, 361 )
end

--������ ������ ��������� ����� (ID 2889)
function ItemUse_MLZHQ ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \227\238\228\232\242\241\255 \234 \232\241\239\238\235\252\231\238\226\224\237\232\254 \237\224 \236\238\240\229." )
		--SystemNotice( role , "�� ������� � ������������� �� ����." )
		--SystemNotice( role , "Not usable on the sea." )
		UseItemFailed ( role )
		return
	end
	local pet_num = GetPetNum(role)
	if pet_num >= 5 then
		SystemNotice( role , "\199\224 \240\224\231 \236\224\234\241\232\236\243\236 \236\238\230\237\238 \226\251\231\226\224\242\252 5 \240\243\247\237\251\245 \230\232\226\238\242\237\251\245. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229!" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	x_resume = 5
	y_resume = 5
	x = x + x_resume
	y = y + y_resume
	local MonsterID =931
	local Refresh = 3600
	local life = 3600000
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaHost(new,role)
	SetChaLifeTime( new, life )
	SetChaTarget(new, role)
	PlayEffect( new, 361 )
end

--������ ������ �������� �������� (ID 2890)
function ItemUse_XRZHQ ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \227\238\228\232\242\241\255 \234 \232\241\239\238\235\252\231\238\226\224\237\232\254 \237\224 \236\238\240\229." )
		--SystemNotice( role , "�� ������� � ������������� �� ����." )
		--SystemNotice( role , "Not usable on the sea." )
		UseItemFailed ( role )
		return
	end
	local pet_num = GetPetNum(role)
	if pet_num >= 5 then
		SystemNotice( role , "\199\224 \240\224\231 \236\224\234\241\232\236\243\236 \236\238\230\237\238 \226\251\231\226\224\242\252 5 \240\243\247\237\251\245 \230\232\226\238\242\237\251\245. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229!" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	x_resume = 5
	y_resume = 5
	x = x + x_resume
	y = y + y_resume
	local MonsterID =932
	local Refresh = 7200
	local life = 7200000
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaHost(new,role)
	SetChaLifeTime( new, life )
	SetChaTarget(new, role)
	PlayEffect( new, 361 )
end

--������ ������ ���� ������ (ID 2891)
function ItemUse_SDZHQ ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \227\238\228\232\242\241\255 \234 \232\241\239\238\235\252\231\238\226\224\237\232\254 \237\224 \236\238\240\229." )
		--SystemNotice( role , "�� ������� � ������������� �� ����." )
		--SystemNotice( role , "Not usable on the sea." )
		UseItemFailed ( role )
		return
	end
	local pet_num = GetPetNum(role)
	if pet_num >= 5 then
		SystemNotice( role , "\199\224 \240\224\231 \236\224\234\241\232\236\243\236 \236\238\230\237\238 \226\251\231\226\224\242\252 5 \240\243\247\237\251\245 \230\232\226\238\242\237\251\245. \207\238\230\224\235\243\233\241\242\224, \239\238\239\240\238\225\243\233\242\229 \239\238\231\230\229!" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	x_resume = 5
	y_resume = 5
	x = x + x_resume
	y = y + y_resume
	local MonsterID =789
	local Refresh = 10800
	local life = 1080000000000
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaHost(new,role)
	SetChaLifeTime( new, life )
	SetChaTarget(new, role)
	PlayEffect( new, 361 )
end

--�������������� ������� (ID 2897)
function ItemUse_SDDLB ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <=5 then
		SystemNotice(role ,"\215\242\238\225\251 \238\242\234\240\251\242\252 \208\238\230\228\229\241\242\226\229\237\241\234\232\233 \239\238\228\224\240\238\234 \239\238 \234\240\224\233\237\229\233 \236\229\240\229 \242\240\229\225\243\229\242\241\255 6 \241\226\238\225\238\228\237\251\245 \241\235\238\242\238\226 \226 \194\224\248\229\236 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \208\238\230\228\229\241\242\226\229\237\241\234\232\233 \239\238\228\224\240\238\234.")
		--SystemNotice(role ,"����� ������� �������������� ������� �� ������� ���� ��������� 6 ��������� ������ � ����� ���������. ���������� ������� �������������� �������.")
		--SystemNotice(role ,"You require at least 6 empty inventory slots. Failed to open Christmas Box.")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2894  , 1 , 4) 
	GiveItem ( role , 0 , 2893  , 10 , 4) 
	GiveItem ( role , 0 , 2889  , 1 , 4) 
	GiveItem ( role , 0 , 2890 , 1 , 4) 
	GiveItem ( role , 0 , 2891  , 1 , 4) 
	GiveItem ( role , 0 , 2896  , 99 , 4) 
end

--------------------------------------------------------------------------------------------------
--������
--------------------------------------------------------------------------------------------------

--������� �� ������� (������ ��������) (ID 2446)
function TW_Ticket_Script1(role, Item )
	local i = CheckBagItem(role,2446)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,2446,1)
			if j == 1 then
				GoTo( role,  2816, 3255, "darkblue")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� �� ������ ��������? (ID 2447)
function TW_Ticket_Script2(role, Item )
	local i = CheckBagItem(role,2447)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,2447,1)
			if j == 1 then
				GoTo( role,  609 , 624 , "jialebi")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--������� �� ���� ����� (ID 2491)
function TW_Ticket_Script3(role, Item )
	local i = CheckBagItem(role,2491)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,2491,1)
			if j == 1 then
				GoTo( role,  1080 , 210 , "jialebi" )
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--------------------------------------------------------------------------------------------------
--����� ���
--------------------------------------------------------------------------------------------------

--���������� ���������� ������� (ID 2893)
function ItemUse_JMSDBOX ( role , Item )
	local item_type = BoxXiang_BaoZhaBOX
	local item_type_rad = BoxXiang_BaoZhaBOX_Rad
	local item_type_count = BoxXiang_BaoZhaBOX_Count
	local maxitem = BoxXiang_baozhabao_Mxcount
	local item_quality = BoxXiang_baozhabao_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
		
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229 \245\226\224\242\224\229\242 \241\226\238\225\238\228\237\251\245 \241\235\238\242\238\226 \226 \194\224\248\229\236 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \200\231\251\241\234\224\237\237\243\254 \239\238\228\224\240\238\247\237\243\254 \234\238\240\238\225\234\243")
		--SystemNotice(role ,"�� ������� ��������� ������ � ����� ���������. ���������� ������� ���������� ���������� �������")
		--SystemNotice(role ,"Not enough slots. Fail to open Posh Christmas Box")
		UseItemFailed ( role )
		return
	end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do
		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break		
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 

	GiveItem ( role , 0 , ItemId , ItemCount , item_quality )
	local GoodItem = {}
	GoodItem[0] = 3111
	GoodItem[1] = 3110
	GoodItem[2] = 3112
	GoodItem[3] = 3886
	GoodItem[4] = 3093
	GoodItem[5] = 3090
	GoodItem[6] = 430
	GoodItem[7] = 179
	GoodItem[8] =3084
	GoodItem[9] =3085
	GoodItem[10] =0244
	GoodItem[11] =0250
	GoodItem[12] =0253
	GoodItem[13] =0260
	GoodItem[14] =0860
	GoodItem[15] =0861
	GoodItem[16] =0862
	GoodItem[17] =3458
	GoodItem[18] =0247
	GoodItem[19] =0271
	local Good_C = 0
	for Good_C = 0 , 19 , 1 do
		if ItemId == GoodItem[Good_C] then
			local itemname = GetItemName ( ItemId ) 
			local cha_name = GetChaDefaultName ( role ) 
			local message = cha_name.." \238\242\234\240\251\226\224\229\242 \200\231\251\241\234\224\237\237\243\254 \239\238\228\224\240\238\247\237\243\254 \234\238\240\238\225\234\243 \232 \239\238\235\243\247\224\229\242 "..itemname  
			--local message = cha_name.." ��������� ���������� ���������� ������� � �������� "..itemname  
			--local message = cha_name.." opens a Posh Christmas Box and obtained "..itemname  
			Notice ( message )
		end
	end
end

--���������� ��������� (ID 2304)
function ItemUse_XNLP( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local CheckDateNum = NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	local star = 0
	if CheckDateNum >= 10122  and CheckDateNum <= 10123 then
		ItemUse_XINBOX ( role , Item )	
	end
end
function ItemUse_XINBOX ( role , Item )
	local item_type = BoxXiang_BaoZhaBOX
	local item_type_rad = BoxXiang_BaoZhaBOX_Rad
	local item_type_count = BoxXiang_BaoZhaBOX_Count
	local maxitem = BoxXiang_baozhabao_Mxcount
	local item_quality = BoxXiang_baozhabao_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
		
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \205\238\226\238\227\238\228\237\232\233 \244\229\233\229\240\226\229\240\234.")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���������� ���������.")
		--SystemNotice(role ,"Insufficient inventory slot. Usage of Grandiose Salute failed.")
		UseItemFailed ( role )
		return
	end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do
		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break		
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 

	GiveItem ( role , 0 , ItemId , ItemCount , item_quality )
	local GoodItem = {}
	GoodItem[0] = 3111
	GoodItem[1] = 3110
	GoodItem[2] = 3112
	GoodItem[3] = 3886
	GoodItem[4] = 3093
	GoodItem[5] = 3090
	GoodItem[6] = 430
	GoodItem[7] = 179
	GoodItem[8] =3084
	GoodItem[9] =3085
	GoodItem[10] =0244
	GoodItem[11] =0250
	GoodItem[12] =0253
	GoodItem[13] =0260
	GoodItem[14] =0860
	GoodItem[15] =0861
	GoodItem[16] =0862
	GoodItem[17] =3458
	GoodItem[18] =0247
	GoodItem[19] =0271
	local Good_C = 0
	for Good_C = 0 , 19 , 1 do
		if ItemId == GoodItem[Good_C] then
			local itemname = GetItemName ( ItemId ) 
			local cha_name = GetChaDefaultName ( role ) 
			local message = cha_name.." \232\241\239\238\235\252\231\243\229\242 \205\238\226\238\227\238\228\237\232\233 \244\229\233\229\240\226\229\240\234 \232 \239\238\235\243\247\224\229\242 "..itemname  
			--local message = cha_name.." ���������� ���������� ��������� � �������� "..itemname 
			--local message = cha_name.." uses Grandiose Salute and obtained "..itemname 
			Notice ( message )
		end
	end
end

--���������� ������ (ID 2307)
function ItemUse_XNBOX( role , Item )
		
	local lv = GetChaAttr(role, ATTR_LV)
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if lv < 40 then
		SystemNotice( role ,"\194\224\248 \243\240\238\226\229\237\252 \237\232\230\229 \247\229\236 40. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \239\240\229\228\236\229\242!")
		--SystemNotice( role ,"��� ������� ���� ��� 40. ���������� ������������ �������!")
		--SystemNotice( role ,"Currently lower than Lv 40. Unable to use item!")
		UseItemFailed ( role )	
	return
	end
	if Item_CanGet < 1 then
		SystemNotice(role ,"\194\224\236 \237\243\230\237\224 1 \241\226\238\225\238\228\237\224\255 \255\247\229\233\234\224 \226 \232\237\226\229\237\242\224\240\229, \247\242\238\225\251 \238\242\234\240\251\242\252 \205\238\226\238\227\238\228\237\232\233 \241\243\237\228\243\234")
		--SystemNotice(role ,"��� ����� 1 ��������� ������ � ���������, ����� ������� ���������� ������")
		--SystemNotice(role ,"You need at least 1 free slot to open chest")
		UseItemFailed ( role )
		return
	end
	local el = math.random ( 1, 30000 )
	if  el>=29700 and el<30000 then
	GiveItem ( role , 0 , 2240  , 1 , 4 ) 
	elseif el>=28700 and el<29700 then
	GiveItem ( role , 0 , 2237  , 1 , 4 ) 
	elseif el>=25700 and el<28700 then
	GiveItem ( role , 0 , 2239  , 1 , 4 ) 
	elseif el>=15700 and el<25700 then
	GiveItem ( role , 0 , 2241  , 1 , 4 )
	else
	local EID = math.random ( 2242, 2245 )
	GiveItem ( role , 0 , EID  , 1 , 4 ) 	
	end
end

--����� ������ (ID 2305)
function ItemUse_SZF ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <1 then
		SystemNotice(role ,"\205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \205\238\236\229\240 \225\232\235\229\242\224. \205\243\230\229\237 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \194\224\248\229\236 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"���������� ������������ ����� ������. ����� 1 ��������� ���� � ����� ���������")
		--SystemNotice(role ,"Unable to use Pirate Voucher 8. Requires at least 1 empty inventory slot")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2306  , 1 , 4)
	local cha_name = GetChaDefaultName ( role ) 
			local message ="\207\238\231\228\240\224\226\235\229\237\232\255" ..cha_name.."\239\238\235\243\247\232\235 \240\224\241\239\232\241\234\243 \237\224 IPOD" 
			--local message ="������������" ..cha_name.."������� �������� �� IPOD" 
			--local message ="Congratulations" ..cha_name.."Obtained 3k RMB worth of IPOD prizes" 
			Notice ( message )
	
end

--������ ������ (ID 2314)
function ItemUse_ShiTouJi( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <1 then
		SystemNotice(role ,"\215\242\238\225\251 \232\241\239\238\235\252\231\238\226\224\242\252 \202\224\236\229\237\252 \239\224\236\255\242\232 \237\243\230\229\237 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \194\224\248\229\236 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"����� ������������ ������ ������ ����� 1 ��������� ���� � ����� ���������")
		--SystemNotice(role ,"To open a Chest requires 1 empty slot")
		UseItemFailed ( role )
		return
	end
	local r1,r2 =MakeItem ( role , STONE_ID  , 1 , 4 )
	local Item_newJL = GetChaItem ( role , 2 , r2 )			
	local Item_newJLID = GetItemID ( Item_newJL )		
	if STONE_LV>8 then
		STONE_LV=8
	end
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_BaoshiLV , STONE_LV )
	local cha_name = GetChaDefaultName ( role )
	LG( "star_stonebox" ,cha_name, STONE_ID , STONE_LV )
end

--------------------------------------------------------------------------------------------------
--������������
--------------------------------------------------------------------------------------------------

--����� � ������ 1 ��. (ID 1145)
function ItemUse_ShaBao1(role , Item)
	local Cha_Boat = 0
      Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local reg = 0
	reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "\210\240\229\237\232\240\238\226\234\224 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229? \221\242\238 \236\229\247\242\224!" )
		--SystemNotice( role , "���������� � ���������� ����? ��� �����!" )
		--SystemNotice( role , "Training in Safe Zone? Dream on!" )
		UseItemFailed ( role )
        return
	end
	local x, y = GetChaPos(role)
	local x_move=5
	local y_move=5
	x=x_move+x
	y=y_move+y
	local MonsterID = 937
    local Refresh = 1900000				        
	local life = 1800000						
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
	SetChaLifeTime( new, life )
end

--����� � ������ 2 ��. (ID 2729)
function ItemUse_ShaBao2(role , Item)
local Cha_Boat = 0
      Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "\210\240\229\237\232\240\238\226\234\224 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229? \221\242\238 \236\229\247\242\224!" )
		--SystemNotice( role , "���������� � ���������� ����? ��� �����!" )
		--SystemNotice( role , "Training in Safe Zone? Dream on!" )
		UseItemFailed ( role )
                return
	end
	        local x, y = GetChaPos(role)
		local x_move=5
		local y_move=5
		x=x_move+x
		y=y_move+y
		local MonsterID = 938
                local Refresh = 1900000				        
		local life = 1800000						
		local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
		SetChaLifeTime( new, life )
end

--����� � ������ 3 ��. (ID 2753)
function ItemUse_ShaBao3(role , Item)
local Cha_Boat = 0
      Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "\210\240\229\237\232\240\238\226\234\224 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229? \221\242\238 \236\229\247\242\224!" )
		--SystemNotice( role , "���������� � ���������� ����? ��� �����!" )
		--SystemNotice( role , "Training in Safe Zone? Dream on!" )
		UseItemFailed ( role )
                return
	end
	        local x, y = GetChaPos(role)
		local x_move=5
		local y_move=5
		x=x_move+x
		y=y_move+y
		local MonsterID = 939
                local Refresh = 1900000				        
		local life = 1800000						
		local new = CreateChaX( MonsterID , x , y , 145 , Refresh , role )
		SetChaLifeTime( new, life )
end

--����� � ������ 4 ��. (ID 2777)
function ItemUse_ShaBao4(role , Item)
local Cha_Boat = 0
      Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "\210\240\229\237\232\240\238\226\234\224 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229? \221\242\238 \236\229\247\242\224!" )
		--SystemNotice( role , "���������� � ���������� ����? ��� �����!" )
		--SystemNotice( role , "Training in Safe Zone? Dream on!" )
		UseItemFailed ( role )
                return
	end
		local x, y = GetChaPos(role)
		local x_move=5
		local y_move=5
		x=x_move+x
		y=y_move+y
		local MonsterID = 961
                local Refresh = 1900000				        
		local life = 1800000						
		local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
		SetChaLifeTime( new, life )
end

--����� � ������ 5 ��. (ID 2801)
function ItemUse_ShaBao5(role , Item)
local Cha_Boat = 0
      Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "\210\240\229\237\232\240\238\226\234\224 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229? \221\242\238 \236\229\247\242\224!" )
		--SystemNotice( role , "���������� � ���������� ����? ��� �����!" )
		--SystemNotice( role , "Training in Safe Zone? Dream on!" )
		UseItemFailed ( role )
                return
	end
		local x, y = GetChaPos(role)
		local x_move=5
		local y_move=5
		x=x_move+x
		y=y_move+y
		local MonsterID = 941
                local Refresh = 1900000				        
		local life = 1800000						
		local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
		SetChaLifeTime( new, life )
end

--��������� ��� 1 ��. (ID 1144)
function ItemUse_FaSheng1(role,Item)
local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
        local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
	      SystemNotice( role , "\194\251\231\238\226 \236\238\237\241\242\240\224 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229? \207\238\230\224\235\243\233\241\242\224, \225\243\228\252\242\229 \226\237\232\236\224\242\229\235\252\237\251!" )
		  --SystemNotice( role , "����� ������� � ���������� ����? ����������, ������ �����������!" )
		  --SystemNotice( role , "Summon a monster in a safe zone? Please be considerate!" )
	      UseItemFailed ( role )
	return
	end
	local radID = math.random ( 1,8 )
	local MonsterID = 0
--	local Monster_GetID = {}
--		Monster_GetID[1] = 841
--		Monster_GetID[2] = 842
--		Monster_GetID[3] = 843
--		Monster_GetID[4] = 844
--		Monster_GetID[5] = 845
--		Monster_GetID[6] = 846
--		Monster_GetID[7] = 229
--		Monster_GetID[8] = 274
--        

	  if radID == 1   then
	       MonsterID = 841
	       
	  elseif radID == 2 then
	       MonsterID = 842
	           
	  elseif radID == 3 then
	       MonsterID = 843

	  elseif radID == 4 then
	       MonsterID = 843

	  elseif radID == 5 then
	       MonsterID = 845
	  elseif radID == 6 then
	       MonsterID = 846
	  elseif radID == 7 then
	       MonsterID = 229
	  elseif radID == 8 then
	       MonsterID = 274

	  end
		
		local x, y = GetChaPos(role)
		local x_move=5
		local y_move=5
		x=x_move+x
		y=y_move+y
                local Refresh = 3700000
		local life =  3600000
		local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
		SetChaLifeTime( new, life )
end

--��������� ��� 2 ��. (ID 2728)
function ItemUse_FaSheng2(role,Item)
local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
        local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then	
	      SystemNotice( role , "\194\251\231\238\226 \236\238\237\241\242\240\224 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229? \207\238\230\224\235\243\233\241\242\224, \225\243\228\252\242\229 \226\237\232\236\224\242\229\235\252\237\251!" )
		  --SystemNotice( role , "����� ������� � ���������� ����? ����������, ������ �����������!" )
		  --SystemNotice( role , "Summon a monster in a safe zone? Please be considerate!" )
	      UseItemFailed ( role )
	return
	end
	local radID = math.random ( 1,15 )
	local MonsterID = 0
--	local Monster_GetID = {}
--
--                Monster_GetID[1] = 847      
--		Monster_GetID[2] = 848
--		Monster_GetID[3] = 849
--		Monster_GetID[4] = 850
--		Monster_GetID[5] = 851
--		Monster_GetID[6] = 852
--		Monster_GetID[7] = 211
--		Monster_GetID[8] = 706
--		Monster_GetID[9] = 673
--		Monster_GetID[10] = 690
--		Monster_GetID[11] = 691
--		Monster_GetID[12] = 692
--		Monster_GetID[13] = 693
--		Monster_GetID[14] = 106
--		Monster_GetID[15] = 289

		local x, y = GetChaPos(role)
		local x_move=5
		local y_move=5
		x=x_move+x
		y=y_move+y
	  if radID == 1 then
	      MonsterID = 847
	  elseif radID == 2 then
	      MonsterID = 848
	  elseif radID == 3 then 
	      MonsterID = 849
	  elseif radID == 4 then 
	      MonsterID = 850
          elseif radID == 5 then
	      MonsterID = 851
	    elseif radID == 6 then
	      MonsterID = 852
	    elseif radID == 7 then
	      MonsterID = 211
	    elseif radID == 8 then
	      MonsterID = 706
	    elseif radID == 9 then
	      MonsterID = 673
	    elseif radID == 10 then
	      MonsterID = 690
	    elseif radID == 11 then
	      MonsterID = 691
	    elseif radID == 12 then
	      MonsterID = 692
	    elseif radID == 13 then
	      MonsterID = 693
	    elseif radID == 14 then
	      MonsterID = 106
	    elseif radID == 15 then
	      MonsterID = 289
	  end
		local Refresh = 3700000
		local life = 3600000
		local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
		SetChaLifeTime( new, life )
end

--��������� ��� 3 ��. (ID 2752)
function ItemUse_FaSheng3(role,Item)
local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
        local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then	
	      SystemNotice( role , "\194\251\231\238\226 \236\238\237\241\242\240\224 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229? \207\238\230\224\235\243\233\241\242\224, \225\243\228\252\242\229 \226\237\232\236\224\242\229\235\252\237\251!" )
		  --SystemNotice( role , "����� ������� � ���������� ����? ����������, ������ �����������!" )
		  --SystemNotice( role , "Summon a monster in a safe zone? Please be considerate!" )
	      UseItemFailed ( role )
	return
	end
	local radID = math.random ( 1,7 )
	local MonsterID = 0
--	local Monster_GetID = {}
--		Monster_GetID[1] = 757
--		Monster_GetID[2] = 679
--		Monster_GetID[3] = 678
--		Monster_GetID[4] = 707
--		Monster_GetID[5] = 708
--		Monster_GetID[6] = 776
--		Monster_GetID[7] = 74
		 
                local x, y = GetChaPos(role)
		local x_move=5
		local y_move=5
		x=x_move+x
		y=y_move+y
	  if radID == 1 then
	       MonsterID = 757       
	  elseif radID == 2 then
	       MonsterID = 679                          
	  elseif radID == 3 then                    
	       MonsterID = 678                           
	  elseif radID == 4 then                    
	       MonsterID = 707      
	  elseif radID == 5 then
	       MonsterID = 708                          
          elseif radID == 6 then
	       MonsterID = 776                           
          elseif radID == 7 then
	       MonsterID = 74   
	  end
		local Refresh = 7300000
		local life = 7200000
		local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
		SetChaLifeTime( new, life )
end

--��������� ��� 4 ��. (ID 2776)
function ItemUse_FaSheng4(role,Item)
local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
        local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then	
	      SystemNotice( role , "\194\251\231\238\226 \236\238\237\241\242\240\224 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229? \207\238\230\224\235\243\233\241\242\224, \225\243\228\252\242\229 \226\237\232\236\224\242\229\235\252\237\251!" )
		  --SystemNotice( role , "����� ������� � ���������� ����? ����������, ������ �����������!" )
		  --SystemNotice( role , "Summon a monster in a safe zone? Please be considerate!" )
	      UseItemFailed ( role )
	return
	end
	local radID = math.random ( 1,5 )
	local MonsterID = 0
	local Refresh = 0
	local life = 0
--	local Monster_GetID = {}
--		Monster_GetID[1] = 952
--		Monster_GetID[2] = 805
--		Monster_GetID[3] = 807
--		Monster_GetID[4] = 786
--		Monster_GetID[5] = 788
--		
                local x, y = GetChaPos(role)
		local x_move=5
		local y_move=5
		x=x_move+x
		y=y_move+y
	  if radID == 1 then
	      MonsterID = 952        
	  elseif radID == 2 then
	      MonsterID = 805                          
	  elseif radID == 3 then                    
	      MonsterID = 807                           
	  elseif radID == 4 then                    
	      MonsterID = 786      
	  elseif radID == 5 then
	      MonsterID = 788                           
	  end
	       
	       if MonsterID == 952 then 
	          Refresh = 10900000
	          life = 10800000
	       else
		  Refresh = 7300000
		  life = 7200000
	       end
	          local new = CreateChaX( MonsterID , x , y , 145 , Refresh ,role)
		SetChaLifeTime( new, life )
end

--��������� ��� 5 ��. (ID 2800)
--function ItemUse_FaSheng5(role,Item)
--local Cha_Boat = 0
--	Cha_Boat = GetCtrlBoat ( role )
--	if Cha_Boat ~=  nil then
--		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
--		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
--		--SystemNotice( role , "Cannot use while sailing" )
--		UseItemFailed ( role )
--		return
--	end
--        local reg = 0
--	      reg =IsChaInRegion( role, 2 )
--	if reg == 1 then	
--	      SystemNotice( role , "\194\251\231\238\226 \236\238\237\241\242\240\224 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229? \207\238\230\224\235\243\233\241\242\224, \225\243\228\252\242\229 \226\237\232\236\224\242\229\235\252\237\251!" )
--		  --SystemNotice( role , "����� ������� � ���������� ����? ����������, ������ �����������!" )
--		  --SystemNotice( role , "Summon a monster in a safe zone? Please be considerate!" )
--	      UseItemFailed ( role )
--	return
--	end
--	local radID = math.random ( 1,30 )
--	local MonsterID = 0
--	local Refresh = 0
--	local life = 0
--	local Monster_GetID = {}
--		Monster_GetID[1] = 229 
--		Monster_GetID[2] = 211
--		Monster_GetID[3] = 99
--		Monster_GetID[4] = 673
--		Monster_GetID[5] = 786
--		Monster_GetID[6] = 757
--		Monster_GetID[7] = 263
--		Monster_GetID[8] = math.random ( 678 , 679 )
--                Monster_GetID[9] = math.random ( 841 , 852 )
--		Monster_GetID[10] = math.random ( 690 , 693 )
--		Monster_GetID[11] = math.random ( 706, 708 )
--		Monster_GetID[12] = 952
--		Monster_GetID[13] = 805
--		Monster_GetID[14] = 807
--		
--                local x, y = GetChaPos(role)
--		local x_move=5
--		local y_move=5
--		x=x_move+x
--		y=y_move+y
--	  if radID == 1 or  radID ==2 then
--	      MonsterID = Monster_GetID[8]
--	  elseif radID == 3 or  radID ==4 then
--	      MonsterID = 786                          
--	  elseif radID == 5 or  radID ==6 then                    
--	      MonsterID = 673                           
--	  elseif radID == 7 or  radID ==8 then                    
--	      MonsterID = 757      
--	  elseif radID == 9 or  radID ==10 then
--	      MonsterID = 263
--          elseif radID == 11 or  radID ==12 then
--	      MonsterID = 211                           
--          elseif radID == 13 or  radID ==14 then
--	      MonsterID = 99
--	  elseif radID == 15 or  radID ==16 then
--	      MonsterID = 229
--	  elseif radID == 17 or  radID ==18 or  radID ==19 then
--              MonsterID = Monster_GetID[9]
--	  elseif radID == 20 or  radID ==21 then
--	      MonsterID = Monster_GetID[10]
--          elseif radID == 22 or radID ==23 or radID ==24 then
--	      MonsterID = Monster_GetID[11]
--	  elseif radID == 25 or  radID ==26 then
--	      MonsterID = Monster_GetID[12]
--	  elseif radID == 27 or  radID ==28 then
--	      MonsterID = Monster_GetID[13]
--          elseif radID == 29 or  radID ==30 then
--	      MonsterID = Monster_GetID[14]
--	  end
--	       
--	       if MonsterID == Monster_GetID[12] then 
--	          Refresh = 10900000
--	          life = 10800000
--	       else
--		  Refresh = 7300000
--		  life = 7200000
--	       end
--	          local new = CreateChaX( MonsterID , x , y , 145 , Refresh ,role)
--		SetChaLifeTime( new, life )
--end

--������� ����, 1 ��. (ID 2678)
function ItemUse_SL1 ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		SystemNotice( role , "\204\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238 \242\238\235\252\234\238 \226 \236\238\240\229." )
		--SystemNotice( role , "����� ���� ������������ ������ � ����." )
		--SystemNotice( role , "Can only be used on the sea." )
		UseItemFailed ( role )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "\205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \194\238\228\255\237\243\254 \236\232\237\243 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229" )
		--SystemNotice( role , "���������� ������������ ������� ���� � ���������� ����" )
		--SystemNotice( role , "Unable to use in Safe Zone" )
		UseItemFailed ( role )
                return
	end
	local x,y = GetChaPos(Cha_Boat)
	local x_move=0
	local y_move=0
        local fx_move = math.random ( 1,8 )
	   if  fx_move == 1 then
	       x_move = 1200
	       y_move = 0
	 elseif fx_move == 2 then
	       x_move=1200
	       y_move=-1200
	 elseif fx_move == 3 then
	       x_move=0
	       y_move=-1000
	 elseif fx_move == 4 then
	       x_move=-1000
	       y_move=-1000
	 elseif fx_move == 5 then
	       x_move=1000
	       y_move=0
	 elseif fx_move == 6 then
	       x_move=-1000
	       y_move=1000
	 elseif fx_move == 7 then
	       x_move=0
	       y_move=1000
	 else  x_move=1000
	       y_move=1000
	 end
	      x =x_move + x
	      y =y_move + y

	local MonsterID = 942
	local Refresh = 700000
	local life = 600000
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,Cha_Boat )
	SetChaLifeTime( new, life )
end

--������� ���� 2 ��. (ID 2742)
function ItemUse_SL2 ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		SystemNotice( role , "\204\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238 \242\238\235\252\234\238 \226 \236\238\240\229." )
		--SystemNotice( role , "����� ���� ������������ ������ � ����." )
		--SystemNotice( role , "Can only be used on the sea." )
		UseItemFailed ( role )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "\205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \194\238\228\255\237\243\254 \236\232\237\243 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229" )
		--SystemNotice( role , "���������� ������������ ������� ���� � ���������� ����" )
		--SystemNotice( role , "Unable to use in Safe Zone" )
		UseItemFailed ( role )
                return
	end
	local x,y = GetChaPos(Cha_Boat)
	local x_move=0
	local y_move=0
        local fx_move = math.random ( 1,8 )
	   if  fx_move == 1 then
	       x_move = 1200
	       y_move = 0
	 elseif fx_move == 2 then
	       x_move=1200
	       y_move=-1200
	 elseif fx_move == 3 then
	       x_move=0
	       y_move=-1000
	 elseif fx_move == 4 then
	       x_move=-1000
	       y_move=-1000
	 elseif fx_move == 5 then
	       x_move=1000
	       y_move=0
	 elseif fx_move == 6 then
	       x_move=-1000
	       y_move=1000
	 elseif fx_move == 7 then
	       x_move=0
	       y_move=1000
	 else  x_move=1000
	       y_move=1000
	 end
	      x =x_move + x
	      y =y_move + y
	local MonsterID = 943
	local Refresh = 700000
	local life = 600000
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,Cha_Boat )
	SetChaLifeTime( new, life )
end

--������� ���� 3 ��. (ID 2766)
function ItemUse_SL3 ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		SystemNotice( role , "\204\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238 \242\238\235\252\234\238 \226 \236\238\240\229." )
		--SystemNotice( role , "����� ���� ������������ ������ � ����." )
		--SystemNotice( role , "Can only be used on the sea." )
		UseItemFailed ( role )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "\205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \194\238\228\255\237\243\254 \236\232\237\243 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229" )
		--SystemNotice( role , "���������� ������������ ������� ���� � ���������� ����" )
		--SystemNotice( role , "Unable to use in Safe Zone" )
		UseItemFailed ( role )
                return
	end
	local x,y = GetChaPos(Cha_Boat)
	local x_move=0
	local y_move=0
        local fx_move = math.random ( 1,8 )
	   if  fx_move == 1 then
	       x_move = 1200
	       y_move = 0
	 elseif fx_move == 2 then
	       x_move=1200
	       y_move=-1200
	 elseif fx_move == 3 then
	       x_move=0
	       y_move=-1000
	 elseif fx_move == 4 then
	       x_move=-1000
	       y_move=-1000
	 elseif fx_move == 5 then
	       x_move=1000
	       y_move=0
	 elseif fx_move == 6 then
	       x_move=-1000
	       y_move=1000
	 elseif fx_move == 7 then
	       x_move=0
	       y_move=1000
	 else  x_move=1000
	       y_move=1000
	 end
	      x =x_move + x
	      y =y_move + y
	local MonsterID = 944
	local Refresh = 700000
	local life = 600000
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,Cha_Boat )
	SetChaLifeTime( new, life )
end

--������� ���� 4 ��. (ID 2790)
function ItemUse_SL4 ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		SystemNotice( role , "\204\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238 \242\238\235\252\234\238 \226 \236\238\240\229." )
		--SystemNotice( role , "����� ���� ������������ ������ � ����." )
		--SystemNotice( role , "Can only be used on the sea." )
		UseItemFailed ( role )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "\205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \194\238\228\255\237\243\254 \236\232\237\243 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229" )
		--SystemNotice( role , "���������� ������������ ������� ���� � ���������� ����" )
		--SystemNotice( role , "Unable to use in Safe Zone" )
		UseItemFailed ( role )
                return
	end
	local x,y = GetChaPos(Cha_Boat)
	local x_move=0
	local y_move=0
        local fx_move = math.random ( 1,8 )
	   if  fx_move == 1 then
	       x_move = 1200
	       y_move = 0
	 elseif fx_move == 2 then
	       x_move=1200
	       y_move=-1200
	 elseif fx_move == 3 then
	       x_move=0
	       y_move=-1000
	 elseif fx_move == 4 then
	       x_move=-1000
	       y_move=-1000
	 elseif fx_move == 5 then
	       x_move=1000
	       y_move=0
	 elseif fx_move == 6 then
	       x_move=-1000
	       y_move=1000
	 elseif fx_move == 7 then
	       x_move=0
	       y_move=1000
	 else  x_move=1000
	       y_move=1000
	 end
	      x =x_move + x
	      y =y_move + y

	local MonsterID = 945
	local Refresh = 700000
	local life = 600000
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,Cha_Boat )
	SetChaLifeTime( new, life )
end

--������� ���� 5 ��. (ID 2814
function ItemUse_SL5 ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		SystemNotice( role , "\204\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238 \242\238\235\252\234\238 \226 \236\238\240\229." )
		--SystemNotice( role , "����� ���� ������������ ������ � ����." )
		--SystemNotice( role , "Can only be used on the sea." )
		UseItemFailed ( role )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "\205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \194\238\228\255\237\243\254 \236\232\237\243 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229" )
		--SystemNotice( role , "���������� ������������ ������� ���� � ���������� ����" )
		--SystemNotice( role , "Unable to use in Safe Zone" )
		UseItemFailed ( role )
                return
	end
	local x,y = GetChaPos(Cha_Boat)
	local x_move=0
	local y_move=0
        local fx_move = math.random ( 1,8 )
	   if  fx_move == 1 then
	       x_move = 1200
	       y_move = 0
	 elseif fx_move == 2 then
	       x_move=1200
	       y_move=-1200
	 elseif fx_move == 3 then
	       x_move=0
	       y_move=-1000
	 elseif fx_move == 4 then
	       x_move=-1000
	       y_move=-1000
	 elseif fx_move == 5 then
	       x_move=1000
	       y_move=0
	 elseif fx_move == 6 then
	       x_move=-1000
	       y_move=1000
	 elseif fx_move == 7 then
	       x_move=0
	       y_move=1000
	 else  x_move=1000
	       y_move=1000
	 end
	      x =x_move + x
	      y =y_move + y

	local MonsterID = 946
	local Refresh = 700000
	local life = 600000
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,Cha_Boat )

	SetChaLifeTime( new, life )
end

--�������� ������� ��. 1 (ID 2372)
function ItemUse_ZBML1 ( role , Item  )
 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( Cha_Boat , "\205\229\227\238\228\237\238 \234 \232\241\239\238\235\252\231\238\226\224\237\232\254 \237\224 \236\238\240\229" )
		--SystemNotice( Cha_Boat , "������� � ������������� �� ����" )
		--SystemNotice( Cha_Boat , "Not usable on the sea" )
		UseItemFailed ( Cha_Boat )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "Unable to use in Safe Zone" )
		--SystemNotice( role , "Unable to use in Safe Zone" )
		--SystemNotice( role , "Unable to use in Safe Zone" )
		UseItemFailed ( role )
                return
	end
	
	local x,y = GetChaPos(role)
	local x_move=0
	local y_move=0
        local fx_move = math.random ( 1,8 )
	   if  fx_move == 1 then
	       x_move = 800
	       y_move = 0
	 elseif fx_move == 2 then
	       x_move=800
	       y_move=-800
	 elseif fx_move == 3 then
	       x_move=0
	       y_move=-800
	 elseif fx_move == 4 then
	       x_move=-800
	       y_move=-800
	 elseif fx_move == 5 then
	       x_move=800
	       y_move=0
	 elseif fx_move == 6 then
	       x_move=-800
	       y_move=800
	 elseif fx_move == 7 then
	       x_move=0
	       y_move=800
	 else  x_move=800
	       y_move=800
	 end
	      x =x_move + x
	      y =y_move + y
	local MonsterID = 947
	local Refresh = 700000
	local life = 600000
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
	SetChaLifeTime( new, life )
end

--������������ ���� 2 ��. (ID 2373)
function ItemUse_ZBML2 ( role , Item  )
 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( Cha_Boat , "\205\229\227\238\228\237\238 \234 \232\241\239\238\235\252\231\238\226\224\237\232\254 \237\224 \236\238\240\229" )
		--SystemNotice( Cha_Boat , "������� � ������������� �� ����" )
		--SystemNotice( Cha_Boat , "Not usable on the sea" )
		UseItemFailed ( Cha_Boat )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "\205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229" )
		--SystemNotice( role , "���������� ������������ � ���������� ����" )
		--SystemNotice( role , "Unable to use in Safe Zone" )
		UseItemFailed ( role )
                return
	end
	
	local x,y = GetChaPos(role)
	local x_move=0
	local y_move=0
        local fx_move = math.random ( 1,8 )
	   if  fx_move == 1 then
	       x_move = 800
	       y_move = 0
	 elseif fx_move == 2 then
	       x_move=800
	       y_move=-800
	 elseif fx_move == 3 then
	       x_move=0
	       y_move=-800
	 elseif fx_move == 4 then
	       x_move=-800
	       y_move=-800
	 elseif fx_move == 5 then
	       x_move=800
	       y_move=0
	 elseif fx_move == 6 then
	       x_move=-800
	       y_move=800
	 elseif fx_move == 7 then
	       x_move=0
	       y_move=800
	 else  x_move=800
	       y_move=800
	 end
	      x =x_move + x
	      y =y_move + y
	local MonsterID = 948
	local Refresh = 700000
	local life = 600000
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
	SetChaLifeTime( new, life )
end

--������������ ���� 3 ��. (ID 2375)
function ItemUse_ZBML3 ( role , Item  )
 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( Cha_Boat , "\205\229\227\238\228\237\238 \234 \232\241\239\238\235\252\231\238\226\224\237\232\254 \237\224 \236\238\240\229" )
		--SystemNotice( Cha_Boat , "������� � ������������� �� ����" )
		--SystemNotice( Cha_Boat , "Not usable on the sea" )
		UseItemFailed ( Cha_Boat )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "\205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229" )
		--SystemNotice( role , "���������� ������������ � ���������� ����" )
		--SystemNotice( role , "Unable to use in Safe Zone" )
		UseItemFailed ( role )
                return
	end
	
	local x,y = GetChaPos(role)
	local x_move=0
	local y_move=0
        local fx_move = math.random ( 1,8 )
	   if  fx_move == 1 then
	       x_move = 800
	       y_move = 0
	 elseif fx_move == 2 then
	       x_move=800
	       y_move=-800
	 elseif fx_move == 3 then
	       x_move=0
	       y_move=-800
	 elseif fx_move == 4 then
	       x_move=-800
	       y_move=-800
	 elseif fx_move == 5 then
	       x_move=800
	       y_move=0
	 elseif fx_move == 6 then
	       x_move=-800
	       y_move=800
	 elseif fx_move == 7 then
	       x_move=0
	       y_move=800
	 else  x_move=800
	       y_move=800
	 end
	      x =x_move + x
	      y =y_move + y
	local MonsterID = 949
	local Refresh = 700000
	local life = 600000
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
	SetChaLifeTime( new, life )
end

--������������ ���� 4 ��. (ID 2379)
function ItemUse_ZBML4 ( role , Item  )
 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( Cha_Boat , "\205\229\227\238\228\237\238 \234 \232\241\239\238\235\252\231\238\226\224\237\232\254 \237\224 \236\238\240\229" )
		--SystemNotice( Cha_Boat , "������� � ������������� �� ����" )
		--SystemNotice( Cha_Boat , "Not usable on the sea" )
		UseItemFailed ( Cha_Boat )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "\205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229" )
		--SystemNotice( role , "���������� ������������ � ���������� ����" )
		--SystemNotice( role , "Unable to use in Safe Zone" )
		UseItemFailed ( role )
                return
	end
	
	local x,y = GetChaPos(role)
	local x_move=0
	local y_move=0
        local fx_move = math.random ( 1,8 )
	   if  fx_move == 1 then
	       x_move = 800
	       y_move = 0
	 elseif fx_move == 2 then
	       x_move=800
	       y_move=-800
	 elseif fx_move == 3 then
	       x_move=0
	       y_move=-800
	 elseif fx_move == 4 then
	       x_move=-800
	       y_move=-800
	 elseif fx_move == 5 then
	       x_move=800
	       y_move=0
	 elseif fx_move == 6 then
	       x_move=-800
	       y_move=800
	 elseif fx_move == 7 then
	       x_move=0
	       y_move=800
	 else  x_move=800
	       y_move=800
	 end
	      x =x_move + x
	      y =y_move + y
	local MonsterID = 950
	local Refresh = 700000
	local life = 600000
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )

	SetChaLifeTime( new, life )
end

--�������� ������ 5 ��. (ID 2380)
function ItemUse_ZBML5 ( role , Item  )
 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( Cha_Boat , "\205\229\227\238\228\237\238 \234 \232\241\239\238\235\252\231\238\226\224\237\232\254 \237\224 \236\238\240\229" )
		--SystemNotice( Cha_Boat , "������� � ������������� �� ����" )
		--SystemNotice( Cha_Boat , "Not usable on the sea" )
		UseItemFailed ( Cha_Boat )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "\205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229" )
		--SystemNotice( role , "���������� ������������ � ���������� ����" )
		--SystemNotice( role , "Unable to use in Safe Zone" )
		UseItemFailed ( role )
                return
	end
	
	local x,y = GetChaPos(role)
	local x_move=0
	local y_move=0
        local fx_move = math.random ( 1,8 )
	   if  fx_move == 1 then
	       x_move = 800
	       y_move = 0
	 elseif fx_move == 2 then
	       x_move=800
	       y_move=-800
	 elseif fx_move == 3 then
	       x_move=0
	       y_move=-800
	 elseif fx_move == 4 then
	       x_move=-800
	       y_move=-800
	 elseif fx_move == 5 then
	       x_move=800
	       y_move=0
	 elseif fx_move == 6 then
	       x_move=-800
	       y_move=800
	 elseif fx_move == 7 then
	       x_move=0
	       y_move=800
	 else  x_move=800
	       y_move=800
	 end
	      x =x_move + x
	      y =y_move + y
	local MonsterID = 951
	local Refresh = 700000
	local life = 600000
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
	SetChaLifeTime( new, life )
end

--------------------------------------------------------------------------------------------------
--�������
--------------------------------------------------------------------------------------------------

--������ ������ (ID 2916)
function ItemUse_LoveBox( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		SystemNotice(role ,"\215\242\238\225\251 \232\241\239\238\235\252\231\238\226\224\242\252 \239\240\229\228\236\229\242 \242\240\229\225\243\229\242\241\255 1 \241\226\238\225\238\228\237\224\255 \255\247\229\233\234\224 \226 \194\224\248\229\236 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"����� ������������ ������� ��������� 1 ��������� ������ � ����� ���������")
		UseItemFailed ( role )
		UseItemFailed ( role )
		return
	end
	local cha_type = GetChaTypeID ( role ) 
	local count = 0
	if cha_type == 3 or cha_type == 4 then 
	       count =1
	end
	if cha_type == 1 or cha_type == 2 then
	       count =2
	end
	local el = math.random ( 1, 35 )
	if   count == 1 then
		if el==35 then
			local r1 = 0
			local r2 = 0	
			r1,r2 =MakeItem ( role , 2902  , 1 , 4 )
			local Item_girl = GetChaItem ( role , 2 , r2 )
			local new_el=math.random ( 1, 200 )
			SetItemAttr ( Item_girl , ITEMATTR_VAL_STR , new_el )	
		else
			local el1 = math.random ( 1, 12 )
			if el1==1  then
				GiveItem ( role , 0 , 3343  , 1 , 4 )
			elseif el1==2 then
				GiveItem ( role , 0 , 3077  , 1 , 4 )
			else
				local EID = math.random ( 4264, 4273 )
				GiveItem ( role , 0 , EID  , 1 , 4 )
			end
		end
	end
	local el2= math.random ( 1, 7 )
	if   count == 2 then
			--SystemNotice(role ,"count=="..count)
		if el2==7 then
			local r1 = 0
			local r2 = 0	
				r1,r2 =MakeItem ( role , 2903  , 1 , 4 )
			local Item_boy = GetChaItem ( role , 2 , r2 )
			local new_el=math.random ( 1, 1000 )
			--SystemNotice(role ,"new_el=="..new_el)
			SetItemAttr( Item_boy , ITEMATTR_VAL_STR , new_el )
		else
			local el3 = math.random ( 1, 12 )
			if el3==1  then
				GiveItem ( role , 0 , 3343  , 1 , 4 )
			elseif el3==2 then
				GiveItem ( role , 0 , 3077  , 1 , 4 )
			else
				local EID = math.random ( 4264, 4273 )
				GiveItem ( role , 0 , EID  , 1 , 4 )
			end
		end
	end
end

--������ ������ (ID 2915)
function ItemUse_MarryBox ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"\194\224\236 \237\243\230\237\238 4 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224 \226 \232\237\226\229\237\242\224\240\229, \247\242\238\225\251 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \239\235\224\242\252\255")
		--SystemNotice(role ,"��� ����� 4 ��������� ����� � ���������, ����� ������� ������ ������")
		--SystemNotice(role ,"you need at least 4 free slot to open Chest of Gown")
		UseItemFailed ( role )
		return
	end
	local cha_type = GetChaTypeID ( role ) 
	if cha_type == 3  then 
	       GiveItem ( role , 0 , 5244  , 1 , 4 )
	       GiveItem ( role , 0 , 5245  , 1 , 4 )
	       GiveItem ( role , 0 , 5246  , 1 , 4 )
	       GiveItem ( role , 0 , 5247  , 1 , 4 )
	elseif cha_type == 4  then 
	       GiveItem ( role , 0 , 5252  , 1 , 4 )
	       GiveItem ( role , 0 , 5253  , 1 , 4 )
	       GiveItem ( role , 0 , 5254  , 1 , 4 )
	       GiveItem ( role , 0 , 5255  , 1 , 4 )
	elseif cha_type == 1 then 
	       GiveItem ( role , 0 , 5221  , 1 , 4 )
	       GiveItem ( role , 0 , 5222  , 1 , 4 )
	       GiveItem ( role , 0 , 5223  , 1 , 4 )
	elseif cha_type == 2 then 
	       GiveItem ( role , 0 , 5238  , 1 , 4 )
	       GiveItem ( role , 0 , 5239  , 1 , 4 )
	       GiveItem ( role , 0 , 5240  , 1 , 4 )
	end
end

--������� ������� (ID 2904)
function ItemUse_JRDQBox( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 10 then
		SystemNotice(role ,"\194\224\236 \237\243\230\237\238 10 \241\226\238\225\238\228\237\251\245 \241\235\238\242\238\226 \226 \232\237\226\229\237\242\224\240\229, \247\242\238\225\251 \232\241\239\238\235\252\231\238\226\224\242\252 \207\238\228\224\240\238\234 \202\240\224\241\238\242\251")
		--SystemNotice(role ,"��� ����� 10 ��������� ������ � ���������, ����� ������������ ������� �������")
		--SystemNotice(role ,"To open Gift of the Beauty requires at least 10 empty inventory slots")
		UseItemFailed ( role )
		return
	end
	local cha_type = GetChaTypeID ( role ) 
	 if cha_type ==1 or cha_type ==2 then
	 SystemNotice(role ,"\207\238\228\224\240\238\234 \202\240\224\241\238\242\251 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237 \242\238\235\252\234\238 \239\229\240\241\238\237\224\230\224\236\232 \230\229\237\241\234\238\227\238 \239\238\235\224")
	 --SystemNotice(role ,"������� ������� ����� ���� ����������� ������ ����������� �������� ����")
	 --SystemNotice(role ,"Gift of the Beauty can only be opened by female")
	UseItemFailed ( role )
		return
	end 
	
	local el = math.random ( 1, 100 )
	if  el>=1 and el<=20 then
	GiveItem ( role , 0 , 3343  , 1 , 4 )
	elseif  el>=21 and el<=40 then
	GiveItem ( role , 0 , 3354  , 1 , 4 )
	GiveItem ( role , 0 , 3355  , 1 , 4 )
	GiveItem ( role , 0 , 3356  , 1 , 4 )
	GiveItem ( role , 0 , 3357  , 1 , 4 )
	GiveItem ( role , 0 , 3358  , 1 , 4 )
	GiveItem ( role , 0 , 3359  , 1 , 4 )
	elseif el>=41 and el<=45 then
	GiveItem ( role , 0 , 937  , 1 , 4 )
	elseif el>=46 and el<=65 then
	GiveItem ( role , 0 , 4264  , 1 , 4 )
	GiveItem ( role , 0 , 4265  , 1 , 4 )
	GiveItem ( role , 0 , 4266  , 1 , 4 )
	GiveItem ( role , 0 , 4267  , 1 , 4 )
	GiveItem ( role , 0 , 4268  , 1 , 4 )
	GiveItem ( role , 0 , 4269  , 1 , 4 )
	GiveItem ( role , 0 , 4270  , 1 , 4 )
	GiveItem ( role , 0 , 4271  , 1 , 4 )
	GiveItem ( role , 0 , 4272  , 1 , 4 )
	GiveItem ( role , 0 , 4273  , 1 , 4 )
	elseif el>=66 and el<=75 then
	GiveItem ( role , 0 , 3094  , 3 , 4 )
	elseif el>=76 and el<=85 then
	GiveItem ( role , 0 , 855  , 10 , 4 )
	elseif el>=86 and el<87 then
	GiveItem ( role , 0 , 1012  , 1 , 4 )
	elseif el>=87 and el<89 and cha_type == 3  then 
	GiveItem ( role , 0 , 5244  , 1 , 4 )
	GiveItem ( role , 0 , 5245  , 1 , 4 )
	GiveItem ( role , 0 , 5246  , 1 , 4 )
	GiveItem ( role , 0 , 5247  , 1 , 4 )
	elseif el>=89 and el<=90 and cha_type == 4 then
	GiveItem ( role , 0 , 5252  , 1 , 4 )
	GiveItem ( role , 0 , 5253  , 1 , 4 )
	GiveItem ( role , 0 , 5254  , 1 , 4 )
	GiveItem ( role , 0 , 5255  , 1 , 4 )
	else
	local EID = math.random ( 1808, 1811 )
	GiveItem ( role , 0 , EID  , 1 , 4 )
	end
end

--������� ����� (ID 2905)
function ItemUse_CJDQBox( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 10 then
		SystemNotice(role ,"you need at least 10 free slot to open Gift of the Hunk")
		--SystemNotice(role ,"��� ����� 10 ��������� ������ � ���������, ����� ������� ������� �����")
		--SystemNotice(role ,"you need at least 10 free slot to open Gift of the Hunk")
		UseItemFailed ( role )
		return
	end
	local cha_type = GetChaTypeID ( role ) 
	 if cha_type ==3 or cha_type ==4 then
		SystemNotice(role ,"\207\238\228\224\240\238\234 \213\224\237\234\224 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237 \242\238\235\252\234\238 \239\229\240\241\238\237\224\230\224\236\232 \236\243\230\241\234\238\227\238 \239\238\235\224")
		--SystemNotice(role ,"������� ����� ����� ���� ����������� ������ ����������� �������� ����")
		--SystemNotice(role ,"Gift of the Hunk can only be opened by male characters")
		UseItemFailed ( role )
		return
	end
	local el = math.random ( 1, 100 )
	if  el>=1 and el<=20 then
	GiveItem ( role , 0 , 3077  , 1 , 4 )
	elseif  el>=21 and el<=40 then
	GiveItem ( role , 0 , 3354  , 1 , 4 )
	GiveItem ( role , 0 , 3355  , 1 , 4 )
	GiveItem ( role , 0 , 3356  , 1 , 4 )
	GiveItem ( role , 0 , 3357  , 1 , 4 )
	GiveItem ( role , 0 , 3358  , 1 , 4 )
	GiveItem ( role , 0 , 3359  , 1 , 4 )
	elseif el>=41 and el<=45 then
	GiveItem ( role , 0 , 0936  , 1 , 4 ) 
	elseif el>=46 and el<=65 then
	GiveItem ( role , 0 , 4264  , 1 , 4 )
	GiveItem ( role , 0 , 4265  , 1 , 4 )
	GiveItem ( role , 0 , 4266  , 1 , 4 )
	GiveItem ( role , 0 , 4267  , 1 , 4 )
	GiveItem ( role , 0 , 4268  , 1 , 4 )
	GiveItem ( role , 0 , 4269  , 1 , 4 )
	GiveItem ( role , 0 , 4270  , 1 , 4 )
	GiveItem ( role , 0 , 4271  , 1 , 4 )
	GiveItem ( role , 0 , 4272  , 1 , 4 )
	GiveItem ( role , 0 , 4273  , 1 , 4 )
	elseif el>=66 and el<=75 then
	GiveItem ( role , 0 , 3094  , 3 , 4 )
	elseif el>=76 and el<=85 then
	GiveItem ( role , 0 , 855  , 10 , 4 )
	elseif el>=86 and el<87 then
	GiveItem ( role , 0 , 0862  , 1 , 4 )
	elseif el>=87 and el<89 and cha_type == 1  then 
	GiveItem ( role , 0 , 5221  , 1 , 4 )
	GiveItem ( role , 0 , 5222  , 1 , 4 )
	GiveItem ( role , 0 , 5223  , 1 , 4 )
	elseif el>=89 and el<=90 and cha_type == 2 then
	GiveItem ( role , 0 , 5238  , 1 , 4 )
	GiveItem ( role , 0 , 5239  , 1 , 4 )
	GiveItem ( role , 0 , 5240  , 1 , 4 )
	else
	local EID = math.random ( 1808, 1811 )
	GiveItem ( role , 0 , EID  , 1 , 4 )
	end
end

--��������� �������� (ID 2906)
function ItemUse_XTBOX ( role , Item )
	local item_type = BoxXiang_BaoZhaBOX
	local item_type_rad = BoxXiang_BaoZhaBOX_Rad
	local item_type_count = BoxXiang_BaoZhaBOX_Count
	local maxitem = BoxXiang_baozhabao_Mxcount
	local item_quality = BoxXiang_baozhabao_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
		
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \209\226\224\228\229\225\237\251\229 \209\235\224\228\238\241\242\232")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ��������� ��������")
		--SystemNotice(role ,"Insufficient inventory slots. Failed to use Wedding Candy")
		UseItemFailed ( role )
		return
	end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do
		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break		
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 

	GiveItem ( role , 0 , ItemId , ItemCount , item_quality )
	local GoodItem = {}
	GoodItem[0] = 3111
	GoodItem[1] = 3110
	GoodItem[2] = 3112
	GoodItem[3] = 3886
	GoodItem[4] = 3093
	GoodItem[5] = 3090
	GoodItem[6] = 430
	GoodItem[7] = 179
	GoodItem[8] =3084
	GoodItem[9] =3085
	GoodItem[10] =0244
	GoodItem[11] =0250
	GoodItem[12] =0253
	GoodItem[13] =0260
	GoodItem[14] =0860
	GoodItem[15] =0861
	GoodItem[16] =0862
	GoodItem[17] =3458
	GoodItem[18] =0247
	GoodItem[19] =0271
	local Good_C = 0
	for Good_C = 0 , 19 , 1 do
		if ItemId == GoodItem[Good_C] then
			local itemname = GetItemName ( ItemId ) 
			local cha_name = GetChaDefaultName ( role ) 
			local message = cha_name.." \232\241\239\238\235\252\231\243\229\242 \209\226\224\228\229\225\237\251\229 \241\235\224\228\238\241\242\232 \232 \239\238\235\243\247\224\229\242 "..itemname  
			--local message = cha_name.." ���������� ��������� �������� � �������� "..itemname 
			--local message = cha_name.." uses a Wedding Candy and obtained "..itemname 
			Notice ( message )
		end
	end
end

--����� �� ���������� ��������� (ID 2907)
function ItemUse_HQBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \210\240\229\225\243\229\242\241\255 3 \241\226\238\225\238\228\237\251\245 \255\247\229\233\234\232 \226 \240\254\234\231\224\234\229, \247\242\238\225\251 \238\242\234\240\251\242\252 \207\224\234\229\242 \241\238 \241\226\224\228\229\225\237\251\236\232 \239\238\228\224\240\234\224\236\232")
		--SystemNotice(role ,"������������ ���������� ����� � ���������. ��������� 3 ��������� ������ � �������, ����� ������� ����� �� ���������� ���������")
		--SystemNotice(role ,"You need at least 3 free slots to open Wedding Gift Parcel")
		UseItemFailed ( role )
		return
	end
	local el = math.random ( 1, 100 )
	if  el>=1 and el<=20 then
	GiveItem ( role , 0 , 1012  , 1 , 4 )
	elseif el>=21 and el<=40 then
	GiveItem ( role , 0 , 1016  , 1 , 4 )
	elseif el>=41 and el<60 then
	GiveItem ( role , 0 , 0333  , 1 , 4 )
	elseif el>=61 and el<=100 then
	GiveItem ( role , 0 , 0273  , 1 , 4 )	
	end
end

--������ ���������� ������ (ID 2909)
function ItemUse_XYPIGBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		SystemNotice(role ,"\210\240\229\225\243\229\242\241\255 4 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224 \226 \194\224\248\229\236 \232\237\226\229\237\242\224\240\229, \247\242\238\225\251 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \241\247\224\241\242\235\232\226\238\233 \245\240\254\248\234\232")
		--SystemNotice(role ,"��������� 4 ��������� ����� � ����� ���������, ����� ������� ������ ���������� ������")
		--SystemNotice(role ,"You need at least 4 empty slots to open Lucky Piggy Chest")
		UseItemFailed ( role )
		return
	end
	local el = math.random ( 1, 100 )
	if  el>=1 and el<=4 then
	GiveItem ( role , 0 , 1012  , 1 , 4 )
	elseif el==5  then
	GiveItem ( role , 0 , 1016  , 1 , 4 )
	elseif el>=6 and el<=30 then
	GiveItem ( role , 0 , 0861  , 1 , 4 )
	elseif el>=31 and el<=60 then
	GiveItem ( role , 0 , 885  , 1 , 4 )
	elseif el>=61 and el<=75 then
	GiveItem ( role , 0 , 0860  , 1 , 4 )
	elseif el>=76 and el<=88 then
	GiveItem ( role , 0 , 0862  , 1 , 4 )
	elseif el>=89 and el<=100 then
	GiveItem ( role , 0 , 0863  , 1 , 4 )
	end
end

--����� ������������ ������� (ID 2910)
function ItemUse_YSB( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\243\230\229\237 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \194\224\248\229\236 \232\237\226\229\237\242\224\240\229, \247\242\238\225\251 \238\242\234\240\251\242\252 \204\229\248\238\234 \225\235\224\227\238\239\238\235\243\247\232\255 \239\232\240\224\242\232\232")
		--SystemNotice(role ,"������������ ����� � ���������. ����� 1 ��������� ���� � ����� ���������, ����� ������� ����� ������������ �������")
		--SystemNotice(role ,"You need at least 1 empty slots to open Auspicious Bag")
		UseItemFailed ( role )
		return
	end
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local CheckDateNum = NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	local star = 0
	if CheckDateNum >= 21723  and CheckDateNum <= 21801 then
		ItemUse_YSBOX ( role , Item )
	else 
		SystemNotice(role ,"\194\240\229\236\255 \229\249\229 \237\229 \239\240\232\248\235\238. \205\229 \239\251\242\224\233\241\255 \236\229\237\255 \238\225\236\224\237\243\242\252!")
		--SystemNotice(role ,"����� ��� �� ������. �� ������� ���� ��������!")
		--SystemNotice(role ,"It is not time yet. Do not try to cheat!")
		UseItemFailed ( role )
		return
	end
end

--------------------------------------------------------------------------------------------------
--�������
--------------------------------------------------------------------------------------------------

function ItemUse_YSBOX ( role , Item )
	local el = math.random ( 1, 1000 )
	if  el>=1 and el<=5 then
		GiveItem ( role , 0 , 1012  , 1 , 4 )
	elseif el>=6 and el<=10 then
		GiveItem ( role , 0 , 1016  , 1 , 4 )
	elseif el>=11 and el<=20 then
		GiveItem ( role , 0 , 0860  , 1 , 4 )
	elseif el>=21 and el<=30 then
		GiveItem ( role , 0 , 0861  , 1 , 4 )
	elseif el>=31 and el<40 then
		GiveItem ( role , 0 , 0862  , 1 , 4 )
	elseif el>=41 and el<=50 then
		GiveItem ( role , 0 , 0863  , 1 , 4 )
	elseif el>=51 and el<=270 then
		GiveItem ( role , 0 , 855  , 99 , 4 )
	elseif el>=271 and el<=500 then
		GiveItem ( role , 0 , 0227  , 5 , 4 )
	elseif el>=501 and el<=750 then
		GiveItem ( role , 0 , 3096  , 3 , 4 )
	elseif el>=751 and el<=1000 then
		GiveItem ( role , 0 , 3094  , 3 , 4 )
	end
end

--������ ������� (ID 2836)
function ItemUse_Hadisi( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224,\237\243\230\237\238 \236\232\237\232\236\243\236 4 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224 \226 \232\237\226\229\237\242\224\240\229 ")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2817  , 1 , 4 )
	GiveItem ( role , 0 , 2818  , 1 , 4 )
	GiveItem ( role , 0 , 2819  , 1 , 4 )
	GiveItem ( role , 0 , 2835  , 1 , 4 )
end

--������ ���� (ID 2837)
function ItemUse_Anhei( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224,\237\243\230\237\238 \236\232\237\232\236\243\236 4 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224 \226 \232\237\226\229\237\242\224\240\229 ")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2820  , 1 , 4 )
	GiveItem ( role , 0 , 2821  , 1 , 4 )
	GiveItem ( role , 0 , 2822  , 1 , 4 )
	GiveItem ( role , 0 , 2835  , 1 , 4 )
end

--������ �������� (ID 2838)
function ItemUse_Diyu( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224,\237\243\230\237\238 \236\232\237\232\236\243\236 4 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224 \226 \232\237\226\229\237\242\224\240\229 ")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2823  , 1 , 4 )
	GiveItem ( role , 0 , 2824  , 1 , 4 )
	GiveItem ( role , 0 , 2825  , 1 , 4 )
	GiveItem ( role , 0 , 2835  , 1 , 4 )
end

--������ ����� (ID 2839)
function ItemUse_Xiuluo( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224,\237\243\230\237\238 \236\232\237\232\236\243\236 4 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224 \226 \232\237\226\229\237\242\224\240\229 ")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2826  , 1 , 4 )
	GiveItem ( role , 0 , 2827  , 1 , 4 )
	GiveItem ( role , 0 , 2828  , 1 , 4 )
	GiveItem ( role , 0 , 2835  , 1 , 4 )
end

--������ ������ (ID 2840)
function ItemUse_Youming( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224,\237\243\230\237\238 \236\232\237\232\236\243\236 4 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224 \226 \232\237\226\229\237\242\224\240\229 ")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2829  , 1 , 4 )
	GiveItem ( role , 0 , 2830  , 1 , 4 )
	GiveItem ( role , 0 , 2831  , 1 , 4 )
	GiveItem ( role , 0 , 2835  , 1 , 4 )
end

--������ ������ (ID 2841)
function ItemUse_Minghe( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224,\237\243\230\237\238 \236\232\237\232\236\243\236 4 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224 \226 \232\237\226\229\237\242\224\240\229 ")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2832  , 1 , 4 )
	GiveItem ( role , 0 , 2833  , 1 , 4 )
	GiveItem ( role , 0 , 2834  , 1 , 4 )
	GiveItem ( role , 0 , 2835  , 1 , 4 )
end

--������ ������ (ID 2842)
function ItemUse_Sishen( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229 " )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"\205\229\238\225\245\238\228\232\236\238 \236\232\237\232\236\243\236 4 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224 \226 \232\237\226\229\237\242\224\240\229 ")
		UseItemFailed ( role )
		return
	end
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
	if lv < 100 then
		SystemNotice(role ,"\194\224\248 \243\240\238\226\229\237\252 \237\232\230\229 \247\229\236 100. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \239\240\229\228\236\229\242 ")
		--SystemNotice(role ,"��� ������� ���� ��� 100. ���������� ������������ �������!")
		UseItemFailed ( role )	
	elseif job == 9 then 
			GiveItem ( role , 0 , 2332  , 1 , 4 ) 
			GiveItem ( role , 0 , 2332  , 1 , 4 ) 
			GiveItem ( role , 0 , 3602  , 1 , 4 ) 
	elseif job == 8 then   
			GiveItem ( role , 0 , 2334  , 1 , 4 ) 
			GiveItem ( role , 0 , 3601  , 1 , 4 ) 
			GiveItem ( role , 0 , 3601  , 1 , 4 ) 
			GiveItem ( role , 0 , 3602  , 1 , 4 ) 
			
	elseif job == 12 then 
			GiveItem ( role , 0 , 2338  , 1 , 4 ) 
			GiveItem ( role , 0 , 2339  , 1 , 4 )  
	elseif job == 16 then 
			GiveItem ( role , 0 , 2336  , 1 , 4 ) 
	elseif job == 13 then    
			GiveItem ( role , 0 , 2341  , 1 , 4 ) 
	elseif job == 14 then    
			GiveItem ( role , 0 , 2343  , 1 , 4 ) 
	else 
		SystemNotice(role ,"\210\240\229\225\243\229\242\241\255 2 \239\240\238\244\229\241\241\232\255 ")
		--SystemNotice(role ,"������� ����� ���� ����������� ������ ����� ������ ������� ��������� ������!")
		UseItemFailed ( role )	
	end
end

--�������� ������ ������� ������� (ID 2843)
function ItemUse_Zhenheilong( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 5 then
		SystemNotice(role ,"\215\242\238\225\251 \238\242\234\240\251\242\252 \199\224\234\238\237\237\251\233 \241\243\237\228\243\234 \215\229\240\237\238\227\238 \228\240\224\234\238\237\224 \239\238 \234\240\224\233\237\229\233 \236\229\240\229 \242\240\229\225\243\229\242\241\255 4 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224 \226 \194\224\248\229\236 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"����� ������� �������� ������ ������� ������� �� ������� ���� ��������� 4 ��������� ����� � ����� ���������")
		--SystemNotice(role ,"You need at least 4 empty slots to open Rightful Chest of Black Dragon")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2367  , 1 , 16 ) 
	GiveItem ( role , 0 , 2368  , 1 , 16 ) 
	GiveItem ( role , 0 , 2369  , 1 , 16 )
        local cha_type = GetChaTypeID ( role )
	if cha_type == 4 then 
		GiveItem ( role , 0 , 2370  , 1 , 16 )		
	end
end

--������ � ������� 4 (ID 2844)
function Jz_Script_4thDy(role, Item )
	local i = CheckBagItem(role,2844)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		--SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,2844,1)
			if j == 1 then
				MoveCity(role,"Abaddon 4")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--����� ������ (ID 2919)
function ItemUse_DathBagA(role, Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		SystemNotice(role ,"\205\229\238\225\245\238\228\232\236\238 2 \241\226\238\225\238\228\237\251\245 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229,\247\242\238\225\251 \238\242\234\240\251\242\252 \193\240\229\236\255 \209\236\229\240\242\232")
		--SystemNotice(role ,"������������ ����� � ���������. ��� ����� 1 ��������� ������ � ����� �������, ����� ������� ����� ������")
		--SystemNotice(role ,"you need at least 1 free slot to open Death's Burden")
		UseItemFailed ( role )
		return
	end
	local star_rad=math.random ( 1, 2 )
	if star_rad==1 or 2 then
		GiveItem ( role , 1 , 2846  , 1 , 16 ) 
		GiveItem ( role , 2 , 2928  , 1 , 16 ) 
	end
end

--����� ������ (ID 2920)
function ItemUse_DathBagB(role, Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		SystemNotice(role ,"\205\229\238\225\245\238\228\232\236\238 2 \241\226\238\225\238\228\237\251\245 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229,\247\242\238\225\251 \238\242\234\240\251\242\252 \193\240\229\236\255 \209\236\229\240\242\232")
		--SystemNotice(role ,"������������ ����� � ���������. ��� ����� 1 ��������� ������ � ����� �������, ����� ������� ����� ������")
		--SystemNotice(role ,"you need at least 1 free slot to open Death's Burden"
		UseItemFailed ( role )
		return
	end
	local star_rad=math.random ( 1, 2 )
	if star_rad==1 or 2 then
		GiveItem ( role , 0 , 2847  , 1 , 16 ) 
		GiveItem ( role , 0 , 2929  , 1 , 16 ) 
	end
end

--����� ������ (ID 2921)
function ItemUse_DathBagC(role, Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		SystemNotice(role ,"\205\229\238\225\245\238\228\232\236\238 2 \241\226\238\225\238\228\237\251\245 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229,\247\242\238\225\251 \238\242\234\240\251\242\252 \193\240\229\236\255 \209\236\229\240\242\232")
		--SystemNotice(role ,"������������ ����� � ���������. ��� ����� 1 ��������� ������ � ����� �������, ����� ������� ����� ������")
		--SystemNotice(role ,"you need at least 1 free slot to open Death's Burden"
		UseItemFailed ( role )
		return
	end
	local star_rad=math.random ( 1, 2 )
	if star_rad==1 or 2 then
		GiveItem ( role , 0 , 2848  , 1 , 16 ) 
		GiveItem ( role , 0 , 2927  , 1 , 16 ) 
	end
end

--����� ������ (ID 2922)
function ItemUse_DathBagD(role, Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		SystemNotice(role ,"\205\229\238\225\245\238\228\232\236\238 2 \241\226\238\225\238\228\237\251\245 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229,\247\242\238\225\251 \238\242\234\240\251\242\252 \193\240\229\236\255 \209\236\229\240\242\232")
		--SystemNotice(role ,"������������ ����� � ���������. ��� ����� 1 ��������� ������ � ����� �������, ����� ������� ����� ������")
		--SystemNotice(role ,"you need at least 1 free slot to open Death's Burden"
		UseItemFailed ( role )
		return
	end
	local star_rad=math.random ( 1, 2 )
	if star_rad==1 or 2 then
		GiveItem ( role , 0 , 2849  , 1 , 16 ) 
		GiveItem ( role , 0 , 2927  , 1 , 16 ) 
	end
end

--����� ������ (ID 2923)
function ItemUse_DathBagE(role, Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		SystemNotice(role ,"\205\229\238\225\245\238\228\232\236\238 2 \241\226\238\225\238\228\237\251\245 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229,\247\242\238\225\251 \238\242\234\240\251\242\252 \193\240\229\236\255 \209\236\229\240\242\232")
		--SystemNotice(role ,"������������ ����� � ���������. ��� ����� 1 ��������� ������ � ����� �������, ����� ������� ����� ������")
		--SystemNotice(role ,"you need at least 1 free slot to open Death's Burden"
		UseItemFailed ( role )
		return
	end
	local star_rad=math.random ( 1, 2 )
	if star_rad==1 or 2 then
		GiveItem ( role , 0 , 2850  , 1 , 16 ) 
		GiveItem ( role , 0 , 2929  , 1 , 16 ) 
	end
end

--����� ������ (ID 2924)
function ItemUse_DathBagF(role, Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		SystemNotice(role ,"\205\229\238\225\245\238\228\232\236\238 2 \241\226\238\225\238\228\237\251\245 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229,\247\242\238\225\251 \238\242\234\240\251\242\252 \193\240\229\236\255 \209\236\229\240\242\232")
		--SystemNotice(role ,"������������ ����� � ���������. ��� ����� 1 ��������� ������ � ����� �������, ����� ������� ����� ������")
		--SystemNotice(role ,"you need at least 1 free slot to open Death's Burden"
		UseItemFailed ( role )
		return
	end
	local star_rad=math.random ( 1, 2 )
	if star_rad==1 or 2 then
		GiveItem ( role , 0 , 2851  , 1 , 16 ) 
		GiveItem ( role , 0 , 2931  , 1 , 16 ) 
	end
end

--����� ������ (ID 2925)
function ItemUse_DathBagG(role, Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		SystemNotice(role ,"\205\229\238\225\245\238\228\232\236\238 2 \241\226\238\225\238\228\237\251\245 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229,\247\242\238\225\251 \238\242\234\240\251\242\252 \193\240\229\236\255 \209\236\229\240\242\232")
		--SystemNotice(role ,"������������ ����� � ���������. ��� ����� 1 ��������� ������ � ����� �������, ����� ������� ����� ������")
		--SystemNotice(role ,"you need at least 1 free slot to open Death's Burden"
		UseItemFailed ( role )
		return
	end
	local star_rad=math.random ( 1, 2 )
	if star_rad==1 or 2 then
		GiveItem ( role , 0 , 2852  , 1 , 16 ) 
		GiveItem ( role , 0 , 2932  , 1 , 16 ) 
	end
end

--����� ������ (ID 2926)
function ItemUse_DathBagH(role, Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		SystemNotice(role ,"\205\229\238\225\245\238\228\232\236\238 2 \241\226\238\225\238\228\237\251\245 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229,\247\242\238\225\251 \238\242\234\240\251\242\252 \193\240\229\236\255 \209\236\229\240\242\232")
		--SystemNotice(role ,"������������ ����� � ���������. ��� ����� 1 ��������� ������ � ����� �������, ����� ������� ����� ������")
		--SystemNotice(role ,"you need at least 1 free slot to open Death's Burden"
		UseItemFailed ( role )
		return
	end
	local star_rad=math.random ( 1, 2 )
	if star_rad==1 or 2 then
		GiveItem ( role , 0 , 2930  , 1 , 16 ) 
		GiveItem ( role , 0 , 2853  , 1 , 16 ) 
	end
end

--------------------------------------------------------------------------------------------------
--����� ������������
--------------------------------------------------------------------------------------------------

--����� ������������ (ID 2941)
function ItemUse_ZSCard(role, Item )
	local i = CheckBagItem(role,2941)
	local k = ChaIsBoat(role)
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	local charLv=Lv ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"\215\242\238\225\251 \232\241\239\238\235\252\231\238\226\224\242\252 \202\224\240\242\243 \239\229\240\229\240\238\230\228\229\237\232\255 \237\243\230\229\237 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \194\224\248\229\236 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"����� ������������ ����� ������������ ����� 1 ��������� ���� � ����� ���������")
		--SystemNotice(role ,"To use a Rebirth Card requires at least 1 empty inventory slot")
		UseItemFailed ( role )
		return
	end
	if charLv<=74  then
		SystemNotice( role , "\194\251 \228\238\235\230\237\251 \225\251\242\252 \243\240\238\226\237\255 75 \232\235\232 \226\251\248\229, \247\242\238\225\251 \232\241\239\238\235\252\231\238\226\224\242\252 \202\224\240\242\243 \239\229\240\229\240\238\230\228\229\237\232\255" )
		--SystemNotice( role , "�� ������ ���� ������ 75 ��� ����, ����� ������������ ����� ������������" )
		--SystemNotice( role , "Your level is too low to use. Must be 75 or above" )
		UseItemsFailed ( role )
		return
	elseif k == 0 then
		if i > 0 then
			local j = DelBagItem(role,2941,1) -- rebirth card
			if j == 1 then
				GiveItem ( role , 0 , 2235 , 1 , 42)
				GoTo( role,  1750 , 909 , "jialebi")
				return
			end
		end
	else
		UseItemsFailed ( role )
	end
		
end

--------------------------------------------------------------------------------------------------
--��������� �����
--------------------------------------------------------------------------------------------------

--������ ������� ��������� (ID 2381)
function ItemUse_SummonBigBOSS(role, Item )
local map_name_role = GetChaMapName ( role )
local Cha_Boat = 0
      Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( Cha_Boat , "\205\229\227\238\228\237\238 \234 \232\241\239\238\235\252\231\238\226\224\237\232\254 \237\224 \236\238\240\229" )
		--SystemNotice( Cha_Boat , "������� � ������������� �� ����" )
		--SystemNotice( Cha_Boat , "Not usable on the sea" )
		UseItemFailed ( Cha_Boat )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "\205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229" )
		--SystemNotice( role , "���������� ������������ � ���������� ����" )
		--SystemNotice( role , "Unable to use in Safe Zone" )
		UseItemFailed ( role )
                return
	end
   if  map_name_role == "guildwar" then
	local x,y = GetChaPos(role)
	if GetChaGuildID(role) <= 200 and GetChaGuildID(role) >= 0 then
	local MonsterID = 1007
	local Refresh = 1300
	local life = 1200000
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
	SetChaLifeTime( new, life )
	SetChaSideID(new,1)
	end

    else 
        SystemNotice( role , "\221\242\238\242 \239\240\229\228\236\229\242 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237 \242\238\235\252\234\238 \237\224 \242\229\240\240\232\242\238\240\232\232 \209\226\255\249\229\237\237\238\233 \194\238\233\237\251" )
		--SystemNotice( role , "���� ������� ����� ���� ����������� ������ �� ���������� ��������� �����" )
		--SystemNotice( role , "This ticket can only be used in Sacred War map" )
        UseItemFailed ( role )
        return
    end

end

--������ � ������ (ID 2986)
function ItemUse_moveDX(role, Item)
local i = CheckBagItem(role,2986)
--local k = ChaIsBoat(role)
 local Cha_Boat = 0
       Cha_Boat = GetCtrlBoat ( role )
	 if Cha_Boat ~=  nil then
		SystemNotice( Cha_Boat , "\205\229\227\238\228\237\238 \234 \232\241\239\238\235\252\231\238\226\224\237\232\254 \237\224 \236\238\240\229" )
		--SystemNotice( Cha_Boat , "������� � ������������� �� ����" )
		--SystemNotice( Cha_Boat , "Not usable on the sea" )
		UseItemFailed ( Cha_Boat )
		return
	 end
	 local reg = 0
	      reg =IsChaInRegion( role, 2 )
	 if reg == 1 then
		SystemNotice( role , "\205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229" )
		--SystemNotice( role , "���������� ������������ � ���������� ����" )
		--SystemNotice( role , "Unable to use in Safe Zone" )
		UseItemFailed ( role )
                return
	 end


 if GetChaGuildID(role) == 0 then
    SystemNotice( role , "\194\251 \237\229 \241\238\241\242\238\232\242\229 \237\232 \226 \238\228\237\238\233 \244\240\224\234\246\232\232. \207\229\240\229\236\229\249\229\237\232\229 \237\229\226\238\231\236\238\230\237\238" )
	--SystemNotice( role , "�� �� �������� �� � ����� �������. ����������� ����������" )
	--SystemNotice( role , "You do not have a guild. Unable to use the pass" )
    UseItemFailed ( role )
    return
 end

local map_name_role = GetChaMapName ( role )
if map_name_role =="guildwar" then
	 if GetChaGuildID(role) <= 100 and GetChaGuildID(role) > 0 and map_name_role =="guildwar" then
			if i > 0 then
				local j = DelBagItem(role,2986,1)
				if j == 1 then
					MoveTo( role,  305, 87,  "guildwar" )
					return
				end
			end
								 

	 elseif GetChaGuildID(role) > 100 and GetChaGuildID(role) <= 200 and map_name_role =="guildwar" then
			 if i > 0 then
				local j = DelBagItem(role,2986,1)
				if j == 1 then
					MoveTo( role,  309, 539,  "guildwar" )
					return
				end
			end
	 
	 else
			UseItemFailed ( role )
			    
	 end

elseif map_name_role =="guildwar2" then

	 if GetChaGuildID(role) <= 100 and GetChaGuildID(role) > 0 and map_name_role =="guildwar2"  then
		       if i > 0 then
				local j = DelBagItem(role,2986,1)
				if j == 1 then
					MoveTo( role,  305, 87,  "guildwar2" )
					return
				end
			end
			
	 elseif GetChaGuildID(role) > 100 and GetChaGuildID(role) <= 200 and map_name_role =="guildwar2"  then
			 if i > 0 then
				local j = DelBagItem(role,2986,1)
				if j == 1 then
					 MoveTo( role,  309, 539,  "guildwar2" )
					return
				end
			end
	 
	 else
			UseItemFailed ( role )
		
   
         end

else
        SystemNotice( role , "\221\242\238\242 \225\232\235\229\242 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237 \242\238\235\252\234\238 \237\224 \242\229\240\240\232\242\238\240\232\232 \209\226\255\249\229\237\237\238\233 \194\238\233\237\251" )
		--SystemNotice( role , "���� ����� ����� ���� ����������� ������ �� ���������� ��������� �����" )
		--SystemNotice( role , "This ticket can only be used in Sacred War map" )
        UseItemFailed ( role )
        return
   end        
end

--------------------------------------------------------------------------------------------------
--������
--------------------------------------------------------------------------------------------------

--������ � ����������� �������� ���� (ID 2955)
function ItemUse_CZBox ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"\205\243\230\237\238 4 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224 \226 \194\224\248\229\236 \232\237\226\229\237\242\224\240\229, \247\242\238\225\251 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \241 \243\234\240\224\248\229\237\232\255\236\232 \234\224\239\232\242\224\237\224 \238\226\237\224")
		--SystemNotice(role ,"����� 4 ��������� ����� � ����� ���������, ����� ������� ������ � ����������� �������� ����")
		--SystemNotice(role ,"To open a Aries Apparel Chest requires at least 4 empty inventory slots")
		UseItemFailed ( role )
		return
	end
	local cha_type = GetChaTypeID ( role ) 
	if cha_type == 3  then 
	     
	       GiveItem ( role , 0 , 5349  , 1 , 4 )
	       GiveItem ( role , 0 , 5350  , 1 , 4 )
	       GiveItem ( role , 0 , 5351  , 1 , 4 )
	elseif cha_type == 4  then 
	       GiveItem ( role , 0 , 5352  , 1 , 4 )
	       GiveItem ( role , 0 , 5353  , 1 , 4 )
	       GiveItem ( role , 0 , 5354  , 1 , 4 )
	       GiveItem ( role , 0 , 5355  , 1 , 4 )
	elseif cha_type == 1 then 
	      
	       GiveItem ( role , 0 , 5341  , 1 , 4 )
	       GiveItem ( role , 0 , 5342  , 1 , 4 )
	       GiveItem ( role , 0 , 5343  , 1 , 4 )
	elseif cha_type == 2 then 
	       
	       GiveItem ( role , 0 , 5345  , 1 , 4 )
	       GiveItem ( role , 0 , 5346  , 1 , 4 )
	       GiveItem ( role , 0 , 5347  , 1 , 4 )
	end
end


--��������������� ������� (ID 2953)
function ItemUse_Foolish ( role , Item )
	local charLv=Lv ( role )
	local Cha_Boat = 0
		Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Exp_el=GetChaAttr (  role , ATTR_CEXP )
	local dif_exp_thalf_c = (DEXP[charLv+1] - DEXP[charLv])*0.03+Exp_el
		SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf_c )
		--SystemNotice( role , "\200\241\239\238\235\252\231\243\233\242\229 \207\229\240\226\238\224\239\240\229\235\252\241\234\232\233 \239\238\228\224\240\238\234 \247\242\238\225\251 \239\238\235\243\247\232\242\252 3% \238\239\251\242\224" )
		----SystemNotice( role , "����������� ��������������� ������� ����� �������� 3% �����" )
		----SystemNotice( role , "Use April's Fool Gift to obtain 3 percent experience points" )
end

--������ ��������� ����� ���� (ID 2990)
function ItemUse_BYSHJZ ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local star = 0
	star =IsChaInRegion( role, 2 )
	if star == 1 then
		SystemNotice( role , "\205\229\226\238\231\236\238\230\237\238 \226\251\231\226\224\242\252 \236\238\237\241\242\240\224 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229" )
		--SystemNotice( role , "���������� ������� ������� � ���������� ����" )
		--SystemNotice( role , "Unable to summon monster in Safe Zone" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	local MonsterID = 1009
	local Refresh = 3700
	local life = 3600000
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaLifeTime( new, life )
end

--------------------------------------------------------------------------------------------------
--����� ������� ������������
--------------------------------------------------------------------------------------------------

--����� ������� �������������� ������� (ID 2956)
function Sk_Script_Wyz ( role , Item ) 											
	local sk_add = SK_WYZ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� ������� �������������� �������� (ID 2957)
function Sk_Script_Bsj ( role , Item ) 											
	local sk_add = SK_BSJ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� ������� ������������� �������� (ID 2958)
function Sk_Script_Emzz ( role , Item ) 											
	local sk_add = SK_EMZZ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� ������� ������������� ������������ (ID 2959)
function Sk_Script_Sssp ( role , Item ) 											
	local sk_add = SK_SSSP 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� ������� �������������� ���������� ����� (ID 2960)
function Sk_Script_Cyn ( role , Item ) 											
	local sk_add = SK_CYN 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� ������� �������������� ������� (ID 2961)
function Sk_Script_Hlp ( role , Item ) 											
	local sk_add = SK_HLP 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

---����� 2��
--����� ������� �������������� ������� (ID 6012)
function Sk_Script_Wyzz ( role , Item ) 											
	local sk_add = SK_WYZ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
	if form_sklv >= 2  then 
		UseItemFailed ( role )  
		return 
	end
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 2 , 2 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� ������� �������������� �������� (ID 6013)
function Sk_Script_Bsjz ( role , Item ) 											
	local sk_add = SK_BSJ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv >= 2  then 
		UseItemFailed ( role )  
		return 
	end
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 2 , 2 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� ������� ������������� �������� (ID 6014)
function Sk_Script_Emzzz ( role , Item ) 											
	local sk_add = SK_EMZZ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv >= 2  then 
		UseItemFailed ( role )  
		return 
	end 
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 2 , 2 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� ������� ������������� ������������ (ID 6015)
function Sk_Script_Ssspz ( role , Item ) 											
	local sk_add = SK_SSSP 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv >= 2  then 
		UseItemFailed ( role )  
		return 
	end
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 2 , 2 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� ������� �������������� ���������� ����� (ID 6016)
function Sk_Script_Cynz ( role , Item ) 											
	local sk_add = SK_CYN 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv >= 2  then 
		UseItemFailed ( role )  
		return 
	end 
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 2 , 2 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� ������� �������������� ������� (ID 6017)
function Sk_Script_Hlpz ( role , Item ) 											
	local sk_add = SK_HLP 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv >= 2  then 
		UseItemFailed ( role )  
		return 
	end 
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 2 , 2 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


--����� 3 ��
--����� ������� �������������� ������� (ID 6019)
function Sk_Script_Wyzx ( role , Item ) 											
	local sk_add = SK_WYZ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
	if form_sklv >= 3  then 
		UseItemFailed ( role )  
		return 
	end
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 3 , 3 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� ������� �������������� �������� (ID 6020)
function Sk_Script_Bsjx ( role , Item ) 											
	local sk_add = SK_BSJ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv >= 3  then 
		UseItemFailed ( role )  
		return 
	end
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 3 , 3 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� ������� ������������� �������� (ID 6021)
function Sk_Script_Emzzx ( role , Item ) 											
	local sk_add = SK_EMZZ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv >= 3  then 
		UseItemFailed ( role )  
		return 
	end 
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 3 , 3 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� ������� ������������� ������������ (ID 6022)
function Sk_Script_Ssspx ( role , Item ) 											
	local sk_add = SK_SSSP 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv >= 3  then 
		UseItemFailed ( role )  
		return 
	end
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 3 , 3 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� ������� �������������� ���������� ����� (ID 6023)
function Sk_Script_Cynx ( role , Item ) 											
	local sk_add = SK_CYN 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv >= 3  then 
		UseItemFailed ( role )  
		return 
	end 
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 3 , 3 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--����� ������� �������������� ������� (ID 6024)
function Sk_Script_Hlpx ( role , Item ) 											
	local sk_add = SK_HLP 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then
--		return 
--	end 
	if form_sklv >= 3  then 
		UseItemFailed ( role )  
		return 
	end 
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 3 , 3 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 




--���������� ���� (ID 2988)
function ItemUse_NiceCake (role, Item )

	local HonorBook_Num = 0
	local HonorBook_Num = CheckBagItem( role,3849 )
		if HonorBook_Num < 1 then
		SystemNotice( role , "\211 \194\224\241 \237\229\242 \236\229\228\224\235\232 \238\242\226\224\227\232")
		--SystemNotice( role , "� ��� ��� ������ ������")
		--SystemNotice( role , "You do not have Mark of Honor")
		UseItemFailed ( role )
		return 0
		end
	local Book2 =  GetChaItem2 ( role , 2 , 3849 )
	local HonorPoint=GetItemAttr ( Book2 , ITEMATTR_VAL_STR)
	local el_fame = GetChaAttr(role, ATTR_FAME)
	
		if HonorPoint < 27000 and el_fame < 99990001 then
		local HonorPoint_X=HonorPoint+10
		SetItemAttr ( Book2 , ITEMATTR_VAL_STR,HonorPoint_X)
		
		local fame_resume = 9999
		el_fame = el_fame + fame_resume
		SetCharaAttr(el_fame, role, ATTR_FAME) 

		else 
		SystemNotice( role , "\211 \194\224\241 \241\235\232\248\234\238\236 \236\237\238\227\238 \238\247\234\238\226 \247\229\241\242\232 \232\235\232 \240\229\239\243\242\224\246\232\232. \221\242\238\242 \239\232\240\238\227 \225\238\235\252\248\229 \237\229 \243\228\238\226\235\229\242\226\238\240\232\242 \194\224\241")
		--SystemNotice( role , "� ��� ������� ����� ����� ����� ��� ���������. ���� ����� ������ �� ������������ ���")
		--SystemNotice( role , "Your Honor or Reputation points are too high. This cake can no longer satisfied you")
		UseItemFailed ( role )
		end
end

--���������� (n\a)
function ItemUse_TJQ ( role , Item )
	local lv= GetChaAttr(role, ATTR_LV) 
	if lv >70 then
		SystemNotice ( role , "\210\238\235\252\234\238 \232\227\240\238\234\232 \243\240\238\226\237\255 70 \232 \226\251\248\229 \236\238\227\243\242 \232\241\239\238\235\252\231\238\226\224\242\252 \253\242\238\242 \239\240\229\228\236\229\242" )
		--SystemNotice ( role , "������ ������ ������ 70 � ���� ����� ������������ ���� �������" )
		--SystemNotice ( role , "Must be lv 70 and lower to use" )
		UseItemFailed ( role )
		return	
	end
	local statelv = 4
	local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
	if ChaStateLv > statelv then
		SystemNotice(role ,"\221\244\244\229\234\242\251 \238\242 \228\240\243\227\232\245 \231\229\235\232\233 \237\229 \241\238\247\232\242\224\254\242\241\255")
		--SystemNotice(role ,"������� �� ������ ����� �� ����������")
		--SystemNotice(role ,"Potions effect for attribute bonus cannot be stacked")
		UseItemFailed ( role )
		return
	end
	local statetime = 1800
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBJYGZ , statelv , statetime )
	else
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end
 
--���������� (n\a)
function ItemUse_65BBBox ( role , Item )
	local job = GetChaAttr( role, ATTR_JOB)
        local cha_type = GetChaTypeID ( role )
	if job == 0 then
		SystemNotice ( role , "\210\238\235\252\234\238 \239\232\240\224\242\251 \239\238\241\235\229 \229\227\238/\229\229 \239\240\238\228\226\232\230\229\237\232\255 \239\238 \241\235\243\230\225\229 \236\238\227\243\242 \232\241\239\238\235\252\231\238\226\224\242\252 \253\242\238\242 \241\243\237\228\243\234.")
		--SystemNotice ( role , "������ ������ ����� ���\�� ����������� �� ������ ����� ������������ ���� ������.")
		--SystemNotice ( role , "Only pirate after his/her fist promotion could use this box.")
		UseItemFailed ( role )
		return
	else
		if job == 12 or job == 2 then
			GiveItem( role , 0 , 780  , 1 , 4 )
		elseif job == 9	then
			GiveItem( role , 0 , 769  , 1 , 4 )
		elseif job == 16 or job == 4 then
			GiveItem( role , 0 , 806  , 1 , 4 )
		elseif job == 8	then
			GiveItem( role , 0 , 766  , 1 , 4 )
		elseif job == 13 or job == 5 then
			GiveItem( role , 0 ,792  , 1 , 4 )
		elseif job == 14 then
			GiveItem( role , 0 , 798  , 1 , 4 )
		elseif job == 1 then
			if cha_type == 1 then
				GiveItem( role , 0 , 769  , 1 , 4 )
			elseif cha_type == 2 then
				GiveItem( role , 0 , 766  , 1 , 4 )
			end
		end
	
	end
end
--=======
---=====
----===  ����� �������
----===  ������ ����� ����������
---=====
--=======
--������ � �������� ���
function ItemUse_YingbiBox ( role , Item )

	local map_name_role = GetChaMapName ( role )
	if map_name_role == "magicsea" then
		local lv = GetChaAttr ( role , ATTR_LV )
		if lv >= 100 then
			local Item_CanGet = GetChaFreeBagGridNum ( role )
			if Item_CanGet < 4 then
				SystemNotice(role ,"\210\240\229\225\243\229\242\241\255 4 \241\226\238\225\238\228\237\251\229 \255\247\229\233\234\232 \226 \232\237\226\229\237\242\224\240\229, \247\242\238\225\251 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \241 \236\238\237\229\242\224\236\232 \244\229\233")
				--SystemNotice(role ,"��������� 4 ��������� ������ � ���������, ����� ������� ������ � �������� ���")
				UseItemFailed ( role )
				return
			end
			local ChaName = GetChaDefaultName(role)
			if PlayUseBox1[ChaName] == nil then
				PlayUseBox1[ChaName] = 0
			end
			local Use_Num = PlayUseBox1[ChaName]
			local now_day= os.date("%d")   
			local now_month= os.date("%m")
			now_month= tonumber(now_month)    
			now_day = tonumber(now_day)
			local Date = JNSTime_Flag[now_month]+now_day
			local Yingbi_Num = 0
			if Use_Num == 0 then
				local Time = 1
				Use_Num = Date * 10 + Time
				Yingbi_Num = 20
				local j = TakeItem ( role , 0 , 855 , Yingbi_Num )
					if j == 1 then 
						PlayUseBox1[ChaName] = Use_Num
						GiveBragiItem ( role , 1 )
						GiveItem ( role , 0 , 1872 , 1 , 4 )
					else
						UseItemFailed ( role )
						SystemNotice( role, "\210\240\229\225\243\229\242\241\255 20 \236\238\237\229\242 \244\229\233")
						--SystemNotice( role, "��������� 20 ����� ���")
					end
			else
				local Date_Box = math.floor ( Use_Num / 10 )
				local a = Date - Date_Box
				local Time = Use_Num - Date_Box * 10
				--SystemNotice ( role , "a="..a)
				if a == 0 then
					Use_Num = Use_Num +1
					local time_new = Time + 1
					if time_new >= 1 and time_new <= 3 then
						Yingbi_Num = (time_new*5) + 15
						--SystemNotice ( role  , "�� ������� ������ � �������� ��� "..time_new.." ���. ���������"..Yingbi_Num.."����� ���")
						local j = TakeItem ( role , 0 , 855 , Yingbi_Num )
						if j == 1 then
							GiveBragiItem ( role , 1 )
							PlayUseBox1[ChaName] = Use_Num
							GiveItem ( role , 0 , 1872 , 1 , 4 )
						else
							UseItemFailed ( role )
							SystemNotice( role, "\205\229\228\238\241\242\224\242\238\247\237\238 \236\238\237\229\242 \244\229\233")
							--SystemNotice( role, "������������ ����� ���")
						end
					elseif time_new >= 4 and time_new <= 6 then
						Yingbi_Num = Time * 15
						--SystemNotice ( role  , "�� ������� ������ � �������� ��� "..time_new.." ���. ���������"..Yingbi_Num.."����� ���")
						local j = TakeItem ( role , 0 , 855 , Yingbi_Num )
						if j == 1 then
							GiveBragiItem ( role , 2 )
							PlayUseBox1[ChaName] = Use_Num
							GiveItem ( role , 0 , 1872 , 1 , 4 )
						else
							UseItemFailed ( role )
							SystemNotice( role, "\205\229\228\238\241\242\224\242\238\247\237\238 \236\238\237\229\242 \244\229\233")
							--SystemNotice( role, "������������ ����� ���")
						end
					else
						Yingbi_Num = 99
						--SystemNotice ( role  , "�� ������� ������ � �������� ��� "..time_new.." ���. ���������"..Yingbi_Num.."����� ���")
						local j = TakeItem ( role , 0 , 855 , Yingbi_Num )
						if j == 1 then
							GiveBragiItem ( role , 3 )
							PlayUseBox1[ChaName] = Use_Num
							GiveItem ( role , 0 , 1872 , 1 , 4 )
						else
							UseItemFailed ( role )
							SystemNotice( role, "\205\229\228\238\241\242\224\242\238\247\237\238 \236\238\237\229\242 \244\229\233")
							--SystemNotice( role, "������������ ����� ���")
						end
					end
				elseif a == -1 then
					UseItemFailed ( role )
					SystemNotice ( role , "\209\243\237\228\243\234 \241 \236\238\237\229\242\224\236\232 \212\229\233 \236\238\230\237\238 \238\242\234\240\251\226\224\242\252 \242\238\235\252\234\238 10 \240\224\231 \226 \228\229\237\252")
					--SystemNotice ( role , "������ � �������� ��� ����� ��������� ������ 10 ��� � ����")
				else
					local Time = 1
					Use_Num = Date * 10 + Time
					Yingbi_Num = 20
					--SystemNotice ( role  , "�� ������� ������ � �������� ��� "..time_new.." ���. ���������"..Yingbi_Num.."����� ���")
					local j = TakeItem ( role , 0 , 855 , Yingbi_Num )
					if j == 1 then
						PlayUseBox1[ChaName] = Use_Num
						GiveBragiItem ( role )
						GiveItem ( role , 0 , 1872 , 1 , 4 )
					else
						UseItemFailed ( role )
						SystemNotice( role, "\205\229\228\238\241\242\224\242\238\247\237\238 \236\238\237\229\242 \244\229\233")
						--SystemNotice( role, "������������ ����� ���")
					end
				end
			end
		else
			SystemNotice( role , "\210\238\235\252\234\238 \232\227\240\238\234\232 \243\240\238\226\237\255 100 \232 \226\251\248\229 \236\238\227\243\242 \238\242\234\240\251\226\224\242\252 \209\243\237\228\243\234 \241 \236\238\237\229\242\224\236\232 \212\229\233")
			--SystemNotice( role , "������ ������ ������ 10 � ���� ����� ��������� ������ � �������� ���")
			UseItemFailed ( role )
		end
	else
		SystemNotice( role , "\209\243\237\228\243\234 \241 \236\238\237\229\242\224\236\232 \212\229\233 \236\238\230\237\238 \238\242\234\240\251\226\224\242\252 \242\238\235\252\234\238 \237\224 \242\229\240\240\232\242\238\240\232\232 \194\229\235\232\234\238\227\238 \209\232\237\229\227\238 \206\234\229\224\237\224")
		--SystemNotice( role , "������ � �������� ��� ����� ��������� ������ �� ���������� �������� ������ ������")
		UseItemFailed ( role )
	end
end

--������������ ������ ���
function ItemUse_HuiYinBox ( role, Item )

	local map_name_role = GetChaMapName ( role )
	if map_name_role == "magicsea" then
		local lv = GetChaAttr ( role , ATTR_LV )
		if lv >= 500 then
			local Item_CanGet = GetChaFreeBagGridNum ( role )
			if Item_CanGet < 2 then
				SystemNotice(role ,"\210\240\229\225\243\229\242\241\255 2 \241\226\238\225\238\228\237\251\229 \255\247\229\233\234\232 \226 \194\224\248\229\236 \232\237\226\229\237\242\224\240\229, \247\242\238\225\251 \238\242\234\240\251\242\252 \199\224\239\229\247\224\242\224\237\237\251\233 \241\243\237\228\243\234 \244\229\233")
				--SystemNotice(role ,"��������� 2 ��������� ������ � ����� ���������, ����� ������� ������������ ������ ���")
				UseItemFailed ( role )
				return
			end
			local ChaName = GetChaDefaultName(role)
			if PlayUseBox2[ChaName] == nil then
				PlayUseBox2[ChaName] = 0
			end
			local Use_Num = PlayUseBox2[ChaName]
			local now_day= os.date("%d")  
			local now_month= os.date("%m")
			now_month= tonumber(now_month)   
			now_day = tonumber(now_day)
			local Date = JNSTime_Flag[now_month]+now_day
			if Use_Num == 0 then
				local Time = 1
				Use_Num = Date * 10 + Time
				local j = TakeItem ( role , 0 , 2588 , 10 )
				if j == 1 then 
					PlayUseBox2[ChaName] = Use_Num
					GiveItem ( role , 0 , 3107 , 1 , 4 )
					GiveItem ( role , 0 , 1570 , 1 , 4 )
				else
					UseItemFailed ( role )
					SystemNotice( role, "\205\229\228\238\241\242\224\242\238\247\237\238 \221\235\252\244\232\233\241\234\232\245 \239\229\247\224\242\229\233")
					--SystemNotice( role, "������������ ���������� �������")
				end
			else
				local Date_Box = math.floor ( Use_Num / 10 )
				local a = Date - Date_Box
				local Time = Use_Num - Date_Box * 10
				if a == 0 then
					local time_new = Time + 1
					if time_new == 1 then
						Use_Num = Use_Num + 1
						local j = TakeItem ( role , 0 , 2588 , 10 )
						if j == 1 then 
							PlayUseBox2[ChaName] = Use_Num
							GiveItem ( role , 0 , 3107 , 1 , 4 )
							GiveItem ( role , 0 , 1570 , 1 , 4 )
						else
							UseItemFailed ( role )
							SystemNotice( role, "\205\229\228\238\241\242\224\242\238\247\237\238 \221\235\252\244\232\233\241\234\232\245 \239\229\247\224\242\229\233")
							--SystemNotice( role, "������������ ���������� �������")
						end
					elseif time_new == 2 then
						Use_Num = Use_Num + 1
						local j = TakeItem ( role , 0 , 2588 , 20 )
						if j == 1 then 
							PlayUseBox2[ChaName] = Use_Num
							XSAddExpAll ( role , 5 , 5, 2)
							GiveItem ( role , 0 , 1570 , 1 , 4 )
						else
							UseItemFailed ( role )
							SystemNotice( role, "\205\229\228\238\241\242\224\242\238\247\237\238 \221\235\252\244\232\233\241\234\232\245 \239\229\247\224\242\229\233")
							--SystemNotice( role, "������������ ���������� �������")
						end
					elseif time_new == 3 then
						Use_Num = Use_Num + 1
						local j = TakeItem ( role , 0 , 2588 , 30 )
						if j == 1 then 
							PlayUseBox2[ChaName] = Use_Num
							GiveItem ( role , 0 , 850 , 1 , 4 )
							GiveItem ( role , 0 , 1570 , 1 , 4 )
						else
							UseItemFailed ( role )
							SystemNotice( role, "\205\229\228\238\241\242\224\242\238\247\237\238 \221\235\252\244\232\233\241\234\232\245 \239\229\247\224\242\229\233")
							--SystemNotice( role, "������������ ���������� �������")
						end
					elseif time_new == 4 then
						Use_Num = Use_Num + 1
						local j = TakeItem ( role , 0 , 2588 , 40 )
						if j == 1 then 
							PlayUseBox2[ChaName] = Use_Num
							GiveItem ( role , 0 , 852 , 1 , 4 )
							GiveItem ( role , 0 , 1570 , 1 , 4 )
						else
							UseItemFailed ( role )
							SystemNotice( role, "\205\229\228\238\241\242\224\242\238\247\237\238 \221\235\252\244\232\233\241\234\232\245 \239\229\247\224\242\229\233")
							--SystemNotice( role, "������������ ���������� �������")
						end
					elseif time_new == 5 then
						Use_Num = ( Date + 1 )*10
						local j = TakeItem ( role , 0 , 2588 , 50 )
						if j == 1 then 
							PlayUseBox2[ChaName] = Use_Num
							GiveItem ( role , 0 , 851 , 1 , 4 )
							GiveItem ( role , 0 , 1570 , 1 , 4 )
						else
							UseItemFailed ( role )
							SystemNotice( role, "\205\229\228\238\241\242\224\242\238\247\237\238 \221\235\252\244\232\233\241\234\232\245 \239\229\247\224\242\229\233")
							--SystemNotice( role, "������������ ���������� �������")
						end
					end
				elseif a == -1 then
					UseItemFailed ( role )
					SystemNotice ( role , "\199\224\239\229\247\224\242\224\237\237\251\233 \241\243\237\228\243\234 \244\229\233 \236\238\230\237\238 \238\242\234\240\251\226\224\242\252 \242\238\235\252\234\238 5 \240\224\231 \226 \228\229\237\252")
					--SystemNotice ( role , "������������ ������ ��� ����� ��������� ������ 5 ��� � ����")
				else
					local Time = 1
					Use_Num = Date * 10 + Time
					local j = TakeItem ( role , 0 , 2588 , 10 )
					if j == 1 then
						PlayUseBox2[ChaName] = Use_Num
						GiveItem ( role , 0 , 3107 , 1 , 4 )
						GiveItem ( role , 0 , 1570 , 1 , 4 )
					else
						UseItemFailed ( role )
						SystemNotice( role, "\205\229\228\238\241\242\224\242\238\247\237\238 \221\235\252\244\232\233\241\234\232\245 \239\229\247\224\242\229\233")
						--SystemNotice( role, "������������ ���������� �������")
					end
				end
			end
		else
			SystemNotice( role , "\210\238\235\252\234\238 \232\227\240\238\234\232 \243\240\238\226\237\255 500 \232 \226\251\248\229 \236\238\227\243\242 \238\242\234\240\251\226\224\242\252 \199\224\239\229\247\224\242\224\237\237\251\233 \241\243\237\228\243\234 \244\229\233")
			--SystemNotice( role , "������ ������ ������ 60 � ���� ����� ��������� ������������ ������ ���")
			UseItemFailed ( role )
		end
	else
		SystemNotice( role , "\199\224\239\229\247\224\242\224\237\237\251\233 \241\243\237\228\243\234 \244\229\233 \236\238\230\237\238 \238\242\234\240\251\226\224\242\252 \242\238\235\252\234\238 \237\224 \242\229\240\240\232\242\238\240\232\232 \194\229\235\232\234\238\227\238 \209\232\237\229\227\238 \206\234\229\224\237\224")
		--SystemNotice( role , "������������ ������ ��� ����� ��������� ������ �� ���������� �������� ������ ������")
		UseItemFailed ( role )
	end
end

--������������ ������ ���������� ���
function ItemUse_HuiYinKBox ( role, Item )

	local map_name_role = GetChaMapName ( role )
	if map_name_role == "magicsea" then
		local lv = GetChaAttr ( role , ATTR_LV )
		if lv >= 1000 then
			local Item_CanGet = GetChaFreeBagGridNum ( role )
			if Item_CanGet < 2 then
				SystemNotice(role ,"\210\240\229\225\243\229\242\241\255 2 \241\226\238\225\238\228\237\251\229 \255\247\229\233\234\232 \226 \232\237\226\229\237\242\224\240\229, \247\242\238\225\251 \238\242\234\240\251\242\252 \199\224\239\229\247\224\242\224\237\237\251\233 \241\243\237\228\243\234 \239\238\226\229\235\232\242\229\235\255 \244\229\233")
				--SystemNotice(role ,"��������� 2 ��������� ������ � ���������, ����� ������� ������������ ������ ���������� ���")
				UseItemFailed ( role )
				return
			end
			local ChaName = GetChaDefaultName(role)
			if PlayUseBox3[ChaName] == nil then
				PlayUseBox3[ChaName] = 0
			end
			local Use_Num = PlayUseBox3[ChaName]
			local now_day= os.date("%d") 
			local now_month= os.date("%m")
			now_month= tonumber(now_month)    
			now_day = tonumber(now_day)
			local Date = JNSTime_Flag[now_month]+now_day
			if Use_Num == 0 then
				local Time = 1
				Use_Num = Date * 10 + Time
				local j = TakeItem ( role , 0 , 2589 , 1 )
				if j == 1 then 
					PlayUseBox3[ChaName] = Use_Num
					AddExpAll ( role , 1 , 1, 2 )
					GiveItem ( role , 0 , 1571 , 1 , 4 )
				else
					UseItemFailed ( role )
					SystemNotice( role, "\205\229\228\238\241\242\224\242\238\247\237\238 \221\235\252\244\232\233\241\234\232\245 \234\238\240\238\235\229\226\241\234\232\245 \239\229\247\224\242\229\233")
					--SystemNotice( role, "������������ ���������� ����������� �������")
				end
			else
				local Date_Box = math.floor ( Use_Num / 10 )
				local a = Date - Date_Box
				local Time = Use_Num - Date_Box * 10
				if a == 0 then
					local time_new = Time + 1
					if time_new == 1 then
						Use_Num = Use_Num + 1
						local j = TakeItem ( role , 0 , 2589 , 1 )
						if j == 1 then 
							PlayUseBox3[ChaName] = Use_Num
							AddExpAll ( role , 1 , 1, 2 )
							GiveItem ( role , 0 , 1571 , 1 , 4 )
						else
							UseItemFailed ( role )
							SystemNotice( role, "\205\229\228\238\241\242\224\242\238\247\237\238 \221\235\252\244\232\233\241\234\232\245 \234\238\240\238\235\229\226\241\234\232\245 \239\229\247\224\242\229\233")
							--SystemNotice( role, "������������ ���������� ����������� �������")
						end
					elseif time_new == 2 then
						Use_Num = ( Date + 1 ) * 10
						local j = TakeItem ( role ,  0 , 2589 , 2 )
						if j == 1 then 
							PlayUseBox3[ChaName] = Use_Num
							GiveItem ( role , 0 , 3336 , 1 , 4 )
							GiveItem ( role , 0 , 1571 , 1 , 4 )
						else
							UseItemFailed ( role )
							SystemNotice( role, "\205\229\228\238\241\242\224\242\238\247\237\238 \221\235\252\244\232\233\241\234\232\245 \234\238\240\238\235\229\226\241\234\232\245 \239\229\247\224\242\229\233")
							--SystemNotice( role, "������������ ���������� ����������� �������")
						end
					end
				elseif a == -1 then
					UseItemFailed ( role )
					SystemNotice ( role , "\199\224\239\229\247\224\242\224\237\237\251\233 \241\243\237\228\243\234 \239\238\226\229\235\232\242\229\235\255 \244\229\233 \236\238\230\237\238 \238\242\234\240\251\226\224\242\252 \242\238\235\252\234\238 2 \240\224\231\224 \226 \228\229\237\252")
					--SystemNotice ( role , "������������ ������ ���������� ��� ����� ��������� ������ 2 ���� � ����")
				else
					local Time = 1
					Use_Num = Date * 10 + Time
					local j = TakeItem ( role , 0 , 2589 , 1 )
					if j == 1 then
						PlayUseBox3[ChaName] = Use_Num
						AddExpAll ( role , 1, 1, 2 )
						GiveItem ( role , 0 , 1571 , 1 , 4 )
					else
						UseItemFailed ( role )
						SystemNotice( role, "\205\229\228\238\241\242\224\242\238\247\237\238 \221\235\252\244\232\233\241\234\232\245 \234\238\240\238\235\229\226\241\234\232\245 \239\229\247\224\242\229\233")
						--SystemNotice( role, "������������ ���������� ����������� �������")
					end
				end
			end
		else
			SystemNotice( role , "\210\238\235\252\234\238 \232\227\240\238\234\232 \243\240\238\226\237\255 1000 \232 \226\251\248\229 \236\238\227\243\242 \238\242\234\240\251\226\224\242\252 \199\224\239\229\247\224\242\224\237\237\251\233 \241\243\237\228\243\234 \239\238\226\229\235\232\242\229\235\255 \244\229\233")
			--SystemNotice( role , "������ ������ ������ 70 � ���� ����� ��������� ������������ ������ ���������� ���")
			UseItemFailed ( role )
		end
	else
		SystemNotice( role , "\199\224\239\229\247\224\242\224\237\237\251\233 \241\243\237\228\243\234 \239\238\226\229\235\232\242\229\235\255 \244\229\233 \236\238\230\237\238 \238\242\234\240\251\226\224\242\252 \242\238\235\252\234\238 \237\224 \242\229\240\240\232\242\238\240\232\232 \194\229\235\232\234\238\227\238 \209\232\237\229\227\238 \206\234\229\224\237\224")
		--SystemNotice( role , "������������ ������ ���������� ��� ����� ��������� ������ �� ���������� �������� ������ ������")
		UseItemFailed ( role )
	end
end

--�������
function ItemUse_CZKC ( role , Item )

	local Cha_Boat = 0
	local charLv=Lv ( role )
	local Exp_star=GetChaAttr (  role , ATTR_CEXP )
	local dif_exp_thalf_c = (DEXP[charLv+1] - DEXP[charLv])*0.01+Exp_star
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		UseItemFailed ( role )
		return
	end
	if charLv<86 or charLv>100 then
		SystemNotice( role , "\200\227\240\238\234\232 \237\229 \236\229\237\229\229 86 \232 \237\229 \226\251\248\229 100 \243\240\238\226\237\255 \236\238\227\243\242 \232\241\239\238\235\252\231\238\226\224\242\252 \212\224\241\242\244\243\228" )
		--SystemNotice( role , "������ �� ����� 86 � �� ���� 100 ������ ����� ������������ �������" )
		UseItemFailed ( role )
		return
	end
	if charLv>=86 and charLv<=100 then
		SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf_c )
        end
end

--������ ���������� ��������
function ItemUse_baimodabox (role, Item)

	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		UseItemFailed ( role )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	 if Item_CanGet < 1 then
		SystemNotice(role ,"\210\240\229\225\243\229\242\241\255 1 \241\226\238\225\238\228\237\224\255 \255\247\229\233\234\224 \226 \232\237\226\229\237\242\224\240\229, \247\242\238\225\251 \238\242\234\240\251\242\252 \209\243\237\228\243\234 \193\229\240\236\243\228\241\234\232\245 \238\241\242\240\238\226\238\226")
		--SystemNotice(role ,"��������� 1 ��������� ������ � ���������, ����� ������� ������ ���������� ��������")
		UseItemFailed ( role )
		return
	end
	local	sc = math.random ( 1, 100 )
	
	if  sc <=25 then	
		GiveItem ( role , 0 , 1036 , 50 , 4 )
	elseif sc <=50 then		
		GiveItem ( role , 0 , 0578 , 99 , 4 )
	elseif sc <=75 then
		GiveItem ( role , 0 , 0850 , 99 , 4 )
	else   
		GiveItem ( role , 0 , 0852 , 99 , 4 )
	end
end

--������ "���������� �����" (ID 0853)
function ItemUse_HappyBook ( role , Item )
	local Cha_Boat = 0
	local charLv=Lv ( role )
	local dif_exp_one = DEXP[charLv+1]
	local dif_exp_three = DEXP[charLv+3]
	local dif_exp_five = DEXP[charLv+5]
	local Exp_star=GetChaAttr (  role , ATTR_CEXP )
	local dif_exp_half = (DEXP[charLv+1] - DEXP[charLv])*0.5 +  Exp_star +10
	local dif_exp_thalf = (DEXP[charLv+1] - DEXP[charLv])*0.3  +  Exp_star + 10
	local dif_exp_thalf_b = dif_exp_thalf - DEXP[charLv+1]
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	elseif charLv>=1 and charLv<=9 then
		SetChaAttrI( role , ATTR_CEXP , dif_exp_five )
	elseif charLv>=10 and charLv<=29 then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_three )
	elseif charLv>=30 and charLv<=59 then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_one )
	elseif charLv>=60 and charLv<=75 then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_half )
	elseif charLv>=76 and charLv<=85 and charLv~=79  then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf )
	elseif charLv==79 and dif_exp_thalf_b<=0 then 
			SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf )
	elseif charLv==79 and dif_exp_thalf_b>0 then 
			dif_exp_thalf = dif_exp_thalf_b*0.02 + DEXP[charLv+1]
			SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf )
	elseif charLv>=86 then
		SystemNotice( role , "\194\224\248 \243\240\238\226\229\237\252 \241\235\232\248\234\238\236 \226\251\241\238\234\232\233, \247\242\238\225\251 \232\241\239\238\235\252\231\238\226\224\242\252 \253\242\238\242 \239\240\229\228\236\229\242" )
		--SystemNotice( role , "��� ������� ������� �������, ����� ������������ ���� �������" )
		--SystemNotice( role , "Your level is too high to use" )
		UseItemFailed ( role )
		return
	end
end
--����� �� �. ����
function ItemUse_DDJP(role, Item )

	local i = CheckBagItem(role,6205)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
		--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
		UseItemFailed ( role )
		return
	end

	local map_name = GetChaMapName ( role )
	if map_name == "Pkteam" then
	SystemNotice ( role , "\194\251 \237\224\245\238\228\232\242\229\241\252 \226 \242\254\240\252\236\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \225\232\235\229\242" )
                 --SystemNotice ( role , "�� ���������� � ������. ���������� ������������ �����" )
		UseItemFailed ( role )
		return
	end
	local Ishave = HasRecord( role , 1636 )
		if Ishave == 0 then
                    SystemNotice ( role , "��� �� ����������������,��� ���������� ������ ����� ����� ������ ������� �������� ���������,� ����� �� ������� ������� �� ������ � ��� ����� ��� �������� ������� � ���� ������� �����,� ����� ����� ����� ����� �������((( " )
		UseItemFailed ( role )
		return
	end
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,6205,1)
			if j == 1 then
				MoveCity(role,"Winter Island")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--����� �� ��������� ������
function Jz_Script_yszs (role, Item )
   
    local Now_Week = os.date("%w")
    local Now_WeekNum = tonumber(Now_Week)
    local Now_Time = os.date("%H")
    local Now_TimeNum = tonumber(Now_Time)
    local Now_Miniute= os.date("%M")   
    local Now_Miniute= tonumber(Now_Miniute)
    local CheckDateNum = Now_WeekNum * 10000 + Now_TimeNum * 100+Now_Miniute
 
    if CheckDateNum < 11700  then
        SystemNotice ( role , "\205\229 \226\238\235\237\243\233\241\255, \246\229\240\234\238\226\252 \229\249\229 \237\229 \238\242\234\240\251\235\224\241\252. \207\240\232\245\238\228\232 \236\229\230\228\243 17:00 \232 17:10 \234\224\230\228\251\233 \239\238\237\229\228\229\235\252\237\232\234." )
        --SystemNotice ( role , "�� ��������, ������� ��� �� ���������. ������� ����� 17:00 � 17:10 ������ �����������." )
        UseItemFailed ( role )
        return
    end
   
    if CheckDateNum > 11710 then
        SystemNotice ( role , "\214\229\240\234\238\226\252 \243\230\229 \231\224\234\240\251\235\224\241\252. \207\240\232\245\238\228\232 \226 \241\235\229\228\243\254\249\232\233 \239\238\237\229\228\229\235\252\237\232\234" )
        --SystemNotice ( role , "������� ��� ���������. ������� � ��������� �����������" )
        UseItemFailed ( role )
        return
    end
 
    local i = CheckBagItem(role, 3024)
    local k = ChaIsBoat(role)
    local hp = Hp(role)
    local mxhp = Mxhp(role)
    local sp = Sp(role)
    local mxsp = Mxsp(role)
    if sp < mxsp or hp < mxhp then
        SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
        --SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
        UseItemFailed ( role )
        return
    end
    if k == 0 then
        if i > 0 then
            local j = DelBagItem(role, 3024, 1)
            if j == 1 then
                MoveCity(role, "Church")
                return
            end
        end
    else
        UseItemFailed ( role )
    end
       
end
 
--�������������� ��������� ������
function Jz_Script_jtsyzs(role, Item)
   
    local Now_Day      = os.date("%d")
    local Now_Month    = os.date("%m")
    local Now_Time     = os.date("%H")
    local NowMniuteNum = os.date("%M") 
   
    local NowMiniuteNum = tonumber(Now_Miniute)    
    local NowTimeNum    = tonumber(Now_Time)
    local NowDayNum     = tonumber(Now_Day)
    local NowMonthNum   = tonumber(Now_Month)
   
    local CheckDateNum = NowMonthNum * 1000000 + NowDayNum * 10000 + NowTimeNum * 100 + NowMniuteNum
 
   
    local item_old    = GetChaItem2(role, 2, 3066)
    local old_month   = GetItemAttr(item_old, ITEMATTR_VAL_STA)        
    local old_day     = GetItemAttr(item_old, ITEMATTR_VAL_STR)          
    local old_hour    = GetItemAttr(item_old, ITEMATTR_VAL_CON)          
    local old_miniute = GetItemAttr(item_old, ITEMATTR_VAL_DEX)  
     
    local CheckBook1Num = old_month * 1000000 + old_day * 10000 + old_hour * 100 + old_miniute
    local CheckBook2Num = old_month * 1000000 + old_day * 10000 + (old_hour + 2) * 100 + old_miniute
   
    local i = CheckBagItem(role, 3066)
    local k = ChaIsBoat(role)
    if CheckDateNum < CheckBook1Num and CheckDateNum < CheckBook2Num then
        SystemNotice(role, "���������, ����� ������ ����� ������ ������!")
        UseItemFailed(role)
       
        return
    end
 
    if k ~= 0 then
        SystemNotice(role, "������ ������������ �������������� ��������� ������ �� ����!")
        UseItemFailed(role)
       
        return
    end
   
    if i > 0 then
        DelBagItem(role, 3066, 1)
        MoveCity(role, "Church")
    else
        UseItemFailed(role)
       
        return
    end
end
 
--��������������� �����
function Jz_Script_qj(role, Item)
 
    local Now_Day      = os.date("%d")
    local Now_Month    = os.date("%m")
    local Now_Time     = os.date("%H")
    local NowMniuteNum = os.date("%M")
   
    local NowMiniuteNum = tonumber(Now_Miniute)
    local NowTimeNum    = tonumber(Now_Time)
    local NowDayNum     = tonumber(Now_Day)
    local NowMonthNum   = tonumber(Now_Month)
   
    local CheckDateNum  = NowMonthNum * 1000000 + NowDayNum * 10000 + NowTimeNum * 100 + NowMniuteNum
 
 
    local item_old    = GetChaItem2(role, 2, 3078)
    local old_month   = GetItemAttr(item_old, ITEMATTR_VAL_STA)
    local old_day     = GetItemAttr(item_old, ITEMATTR_VAL_STR)    
    local old_hour    = GetItemAttr(item_old, ITEMATTR_VAL_CON)    
    local old_miniute = GetItemAttr(item_old, ITEMATTR_VAL_DEX)  
     
 
    local CheckBook1Num = old_month * 1000000 + old_day * 10000 + old_hour * 100 + old_miniute
    local CheckBook2Num = old_month * 1000000 + old_day * 10000 + (old_hour + 2) * 100 + old_miniute
   
    if CheckDateNum < CheckBook1Num then
        SystemNotice(role, "����� ��������� �������������� ��� �� ������!")
        UseItemFailed(role)
        return
    end
 
    if CheckDateNum > CheckBook2Num then
        SystemNotice(role, "����� ��������� �������������� ��� ������!")
        UseItemFailed(role)
        return
    end
 
    local i = CheckBagItem(role, 3078)
    local k = ChaIsBoat(role)
    local hp = Hp(role)
    local mxhp = Mxhp(role)
    local sp = Sp(role)
    local mxsp = Mxsp(role)
    if sp < mxsp or hp < mxhp then
        SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
        --SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
        UseItemFailed(role)
        return
    end
   
    if k == 0 then
        if i > 0 then
            local j = DelBagItem(role, 3078, 1)        
            if j == 1 then
                MoveCity(role, "Church")
            end
        end
    else
        UseItemFailed ( role )
    end
end
 
--�������� ������
function ItemUse_JBBOX( role , Item )
    local Item_CanGet = GetChaFreeBagGridNum(role)
    if Item_CanGet < 1 then
        SystemNotice(role, "\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \238\242\234\240\251\242\252 \241\243\237\228\243\234")
        --SystemNotice(role ,"������������ ����� � ���������. ���������� ������� ������")
        --SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
        UseItemFailed(role)
        return
    end
   
    local r1, r2  = MakeItem(role, 3078, 1, 4)
    local Item_el = GetChaItem(role, 2, r2)
 
    local item_old    = GetChaItem2(role, 2, 3066)
    local old_month   = GetItemAttr(item_old, ITEMATTR_VAL_STA)    
    local old_day     = GetItemAttr(item_old, ITEMATTR_VAL_STR)
    local old_hour    = GetItemAttr(item_old, ITEMATTR_VAL_CON)  
    local old_miniute = GetItemAttr(item_old, ITEMATTR_VAL_DEX)  
   
    SetItemAttr(Item_el, ITEMATTR_VAL_STA, old_month)  
    SetItemAttr(Item_el, ITEMATTR_VAL_STR, old_day)  
    SetItemAttr(Item_el, ITEMATTR_VAL_CON, old_hour)
    SetItemAttr(Item_el, ITEMATTR_VAL_DEX, old_miniute)
 
 
    SynChaKitbag(role, 13)
 
end

--�����
function ItemUse_RedBox( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		SystemNotice(role ,"\211 \194\224\241 \228\238\235\230\229\237 \225\251\242\252 \239\238 \234\240\224\233\237\229\233 \236\229\240\229 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"� ��� ������ ���� �� ������� ���� 1 ��������� ���� � ���������")
		UseItemFailed ( role )
		return
	end
	local now_week= os.date("%w")
	local now_hour= os.date("%H")
	local now_miniute= os.date("%M")
	now_week= tonumber(now_week)
	now_hour= tonumber(now_hour)		
	now_miniute= tonumber(now_miniute)
	local CheckDateNum = now_hour*100 +now_miniute
	Notice("CheckDateNum = "..CheckDateNum)
      if now_week==6 or now_week==0 then
		
		if 1800<=CheckDateNum and  CheckDateNum<=2210 then
		SystemNotice( role , "\194\251 \238\242\234\240\251\235\232 \239\224\234\229\242!" )
		--SystemNotice( role , "�� ������� �����!" )
		ItemUse_YSBOX ( role , Item )
		else 
		SystemNotice(role ,"\207\224\234\229\242 \236\238\230\237\238 \238\242\234\240\251\226\224\242\252 \242\238\235\252\234\238 \242\238\235\252\234\238 \226 \226\251\245\238\228\237\251\229 \241 18:00 \228\238 22:10.")
		--SystemNotice(role ,"����� ����� ��������� ������ ������ � �������� � 18:00 �� 22:10.")
		UseItemFailed ( role )
		return
		end
	end
end

--����� �� ������ 65 ��.
function ItemUse_65JZDH ( role , Item )

	local item_type = BaoXiang_65JZDH
	local item_type_rad = BaoXiang_65JZDH_Rad 
	local item_type_count = BaoXiang_65JZDH_Count 
	local maxitem = BaoXiang_65JZDH_Mxcount	
	local item_quality = 4
	local General = 0  
	local ItemId = 0 
	
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
	SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \239\240\229\228\236\229\242")
	--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ �������")
		UseItemFailed ( role )
		return
	end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k

		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 6618 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
end

--����� �� ������ 75 ��.
function ItemUse_75JZDH ( role , Item )

	local item_type = BaoXiang_75JZDH
	local item_type_rad = BaoXiang_75JZDH_Rad 
	local item_type_count = BaoXiang_75JZDH_Count 
	local maxitem = BaoXiang_75JZDH_Mxcount
	local item_quality = 4
	local General = 0  
	local ItemId = 0 
	
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
	SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \239\240\229\228\236\229\242")
	--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ �������")
		UseItemFailed ( role )
		return
	end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k

		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 6638 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
end


---------------------------------------------------
--                  ����������� ����                --
--                                                                 --
---------------------------------------------------
--������ ����� ����� �������(ID 5716) ���������� �������
function ItemUse_HZRYX ( role , Item )

	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <=0 then
		SystemNotice(role ,"����û���㹻�Ŀռ䣬����Ҫ��1����λ���򿪻�ս������ʧ��")
		UseItemFailed ( role )
		return
	end

--	local s = DelBagItem ( role , 5716 , 1 ) 
	local	sc = math.random(1,100)
	local itemname = ""
	if  sc <=30 then	
		GiveItem ( role , 0 , 0992 , 1 , 4 )                    ---------------�ɳ����   ��û���30%
		itemname = "�ɳ����"
	elseif sc <=69 then		
		GiveItem ( role , 0 , 2951 , 1 , 4 )                    ---------------�Ҷ��ӵ���   ��û���39%
		itemname = "�Ҷ��ӵ���"
	elseif sc <=99 then
		local Money_add = 3000000
		AddMoney ( role , 0 , Money_add )                  ---------------��Ǯ300��   ��û���30%
		itemname = "��Ǯ300��"
	else   
		GiveItem ( role , 0 , 0090 , 1 , 4 )                   ---------------��У֮��   ��û���1%
		itemname = "��У֮��"
	end
	local cha_name = GetChaDefaultName ( role )
	local Guild_ID = GetChaGuildID(role)
	local Guild_Name = GetGuildName( Guild_ID )
	Notice ( Guild_Name.."�����ù���սʤ��,��Ա"..cha_name.."������ս�����䣬��ϲ�ػ��"..itemname )

end

--Kut's Magazine(ID 5768) ���� ����� ��� �����, �� ���������� �������
function ItemUse_generalbook ( role , Item )

	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )
		SystemNotice(role ,"��δת������ʹ��ͨ�����־")
		return 
	end
	if zs_exp >= 10000 then
		UseItemFailed ( role )
		SystemNotice(role ,"ת���ȼ��ﵽ�򳬹�10��,����ʹ��ͨ�����־")
		return 
	end
	local goodluck = "ʹ��ͨ�����־ת���1��"
	if zs_exp > 0 and zs_exp < 400 then 
	SetChaAttrI(role, ATTR_CSAILEXP , 400)
	RefreshCha ( role )
	SystemNotice(role , goodluck)
	end
	if zs_exp >= 400 and zs_exp < 900 then 
	SetChaAttrI(role, ATTR_CSAILEXP , 900)
	RefreshCha ( role )
	SystemNotice(role , goodluck)
	end
	if zs_exp >= 900 and zs_exp < 1600 then 
	SetChaAttrI(role, ATTR_CSAILEXP , 1600)
	RefreshCha ( role )
	SystemNotice(role , goodluck)
	end
	if zs_exp >= 1600 and zs_exp < 2500 then 
	SetChaAttrI(role, ATTR_CSAILEXP , 2500)
	RefreshCha ( role )
	SystemNotice(role , goodluck)
	end
	if zs_exp >= 2500 and zs_exp < 3600 then 
	SetChaAttrI(role, ATTR_CSAILEXP , 3600)
	RefreshCha ( role )
	SystemNotice(role , goodluck)
	end
	if zs_exp >= 3600 and zs_exp < 4900 then 
	SetChaAttrI(role, ATTR_CSAILEXP , 4900)
	RefreshCha ( role )
	SystemNotice(role , goodluck)
	end
	if zs_exp >= 4900 and zs_exp < 6400 then 
	SetChaAttrI(role, ATTR_CSAILEXP , 6400)
	RefreshCha ( role )
	SystemNotice(role , goodluck)
	end
	if zs_exp >= 6400 and zs_exp < 8100 then 
	SetChaAttrI(role, ATTR_CSAILEXP , 8100)
	RefreshCha ( role )
	SystemNotice(role , goodluck)
	end
	if zs_exp >= 8100 and zs_exp < 10000 then 
	SetChaAttrI(role, ATTR_CSAILEXP , 10000)
	RefreshCha ( role )
	SystemNotice(role , goodluck)
	end
end


--������(ID 6203) ���������� �������
function ItemUse_HANBAO ( role , Item )  --[[������ʽ]]--

	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("ҩƷʹ��", "��ǰhp = ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("���������Ƿ�hpֵ")  return 
		--LG("ҩƷʹ��", "���������Ƿ�hpֵ","\n" )  
	end 
	hp_resume = 235    
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then --�ӳ������hpʱ����Ϊ���hp
		hp = mxhp 
		--LG("ҩƷʹ��", "�Ѵ�hp�������", "\n" ) 
	end 
		--LG("ҩƷʹ��", "hp�ظ�Ϊ", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )  --[[�������ʽ]]--") 
end 

--�������� ��������(ID 6204)
function ItemUse_KAORUZHU ( role , Item )  --[[������ʽ]]--
	local hp = GetChaAttr(role, ATTR_HP) 

	--LG("ҩƷʹ��", "��ǰhp = ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("���������Ƿ�hpֵ")  return 
		--LG("ҩƷʹ��", "���������Ƿ�hpֵ","\n" )  
	end 
	hp_resume = 280    
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then				 --�ӳ������hpʱ����Ϊ���hp
		hp = mxhp 
		--LG("ҩƷʹ��", "�Ѵ�hp�������", "\n" ) 
	end 
		--LG("ҩƷʹ��", "hp�ظ�Ϊ", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )  --[[�������ʽ]]--") 
end 

--���������� ������(ID 6235)
function ItemUse_SGJZ ( role , Item )  

	local el_exp = GetChaAttr(role, ATTR_CEXP)
	local exp1=el_exp
	local charLv=Lv ( role )
	local exp_resume = 2000000
	el_exp = el_exp + exp_resume
	if charLv>=100 then	
		el_exp = exp1 + exp_resume
	else
		SystemNotice (role , "�ȼ�δ��100��������ʹ��ʧ�ܣ�")
		UseItemFailed(role)
		return
	end
	SetCharaAttr(el_exp, role, ATTR_CEXP) 
end 

--��������� ����� �������(ID 6250)
function ItemUse_DDWQSHUANG( role , Item )

	local Item_CanGet = GetChaFreeBagGridNum ( role )
	local Cha_Boat = GetCtrlBoat ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"����û���㹻�Ŀռ䣬ʹ�ö���˫����������ʧ��")
		UseItemFailed ( role )
		return
	end
	if Cha_Boat ~=  nil then
		SystemNotice( role , "����ʱ����ʹ��" )
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6136  , 1 , 4) 
end

--��������� ����� ��������(ID 6251)
function ItemUse_DDWQNIU( role , Item )

	local Item_CanGet = GetChaFreeBagGridNum ( role )
	local Cha_Boat = GetCtrlBoat ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"����û���㹻�Ŀռ䣬ʹ�ö����޽���������ʧ��")
		UseItemFailed ( role )
		return
	end
	if Cha_Boat ~=  nil then
		SystemNotice( role , "����ʱ����ʹ��" )
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6141 , 1 , 4) 
end

--��������� ����� �������(ID 6252)
function ItemUse_DDWQJU( role , Item )

	local Item_CanGet = GetChaFreeBagGridNum ( role )
	local Cha_Boat = GetCtrlBoat ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"����û���㹻�Ŀռ䣬ʹ�ö����ѻ���������ʧ��")
		UseItemFailed ( role )
		return
	end
	if Cha_Boat ~=  nil then
		SystemNotice( role , "����ʱ����ʹ��" )
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6138 , 1 , 4) 
end

--��������� ����� ���������� �����(ID 6253)
function ItemUse_DDWQHANG( role , Item )

	local Item_CanGet = GetChaFreeBagGridNum ( role )
	local Cha_Boat = GetCtrlBoat ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"����û���㹻�Ŀռ䣬ʹ�ö���������������ʧ��")
		UseItemFailed ( role )
		return
	end
	if Cha_Boat ~=  nil then
		SystemNotice( role , "����ʱ����ʹ��" )
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6140 , 1 , 4) 
end

--��������� ����� ��������(ID 6254)
function ItemUse_DDWQFENG( role , Item )

	local Item_CanGet = GetChaFreeBagGridNum ( role )
	local Cha_Boat = GetCtrlBoat ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"����û���㹻�Ŀռ䣬ʹ�ö�����ӡ��������ʧ��")
		UseItemFailed ( role )
		return
	end
	if Cha_Boat ~=  nil then
		SystemNotice( role , "����ʱ����ʹ��" )
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6142 , 1 , 4) 
end


--��������� ����� ������������(ID 6255)
function ItemUse_DDWQSHENG( role , Item )

	local Item_CanGet = GetChaFreeBagGridNum ( role )
	local Cha_Boat = GetCtrlBoat ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"����û���㹻�Ŀռ䣬ʹ�ö���ʥְ��������ʧ��")
		UseItemFailed ( role )
		return
	end
	if Cha_Boat ~=  nil then
		SystemNotice( role , "����ʱ����ʹ��" )
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6143 , 1 , 4) 
end

--������ ��������(6256)
function ItemUse_SZYINGYONG ( role , Item )

	local Cha_Boat = GetCtrlBoat ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"����û���㹻�Ŀռ䣬ʹ����֮Ӣ�±���ʧ��")
		UseItemFailed ( role )
		return
	end
	if Cha_Boat ~=  nil then
		SystemNotice( role , "����ʱ����ʹ��" )
		UseItemFailed ( role )
		return
	end
	local job = GetChaAttr(role, ATTR_JOB)
	if job~= 12 then
		SystemNotice( role , "ֻ�оѻ��ֲ��ܴ�������ӡ�" )
		UseItemFailed ( role )
		return
	end 
	local i=math.random(1,100)
	if i<=25 then
		GiveItem ( role , 0 , 6173 , 1 , 4)
		return
 	elseif i<=50 then
		GiveItem ( role , 0 , 6174 , 1 , 4)
		return
 	elseif i<=75 then
		GiveItem ( role , 0 , 6175 , 1 , 4)
		return
	elseif i<=100 then
		GiveItem ( role , 0 , 6176 , 1 , 4)
		return
	end
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.."������֮Ӣ�±��侪ϲ�ػ��"..itemname  
	Notice ( message )
end

--������ �����(6257)
function ItemUse_SZRONGYU ( role , Item )

	local Cha_Boat = GetCtrlBoat ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"����û���㹻�Ŀռ䣬ʹ����֮��������ʧ��")
		UseItemFailed ( role )
		return
	end
	if Cha_Boat ~=  nil then
		SystemNotice( role , "����ʱ����ʹ��" )
		UseItemFailed ( role )
		return
	end
	local job = GetChaAttr(role, ATTR_JOB)
	if job~= 9 then
		SystemNotice( role , "ֻ��˫��ʿ���ܴ�������ӡ�" )
		UseItemFailed ( role )
		return
	end
	local i=math.random(1,100)
	if i<=25 then
		GiveItem ( role , 0 , 6177 , 1 , 4)
		return
 	elseif i<=50 then
		GiveItem ( role , 0 , 6178 , 1 , 4)
		return
 	elseif i<=75 then
		GiveItem ( role , 0 , 6179 , 1 , 4)
		return
	elseif i<=100 then
		GiveItem ( role , 0 , 6180 , 1 , 4)
		return
	end
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.."������֮�������侪ϲ�ػ��"..itemname  
	Notice ( message )
end

--������ ������(6258)
function ItemUse_SZXISHENG ( role , Item )

	local Cha_Boat = GetCtrlBoat ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"����û���㹻�Ŀռ䣬ʹ����֮��������ʧ��")
		UseItemFailed ( role )
		return
	end
	if Cha_Boat ~=  nil then
		SystemNotice( role , "����ʱ����ʹ��" )
		UseItemFailed ( role )
		return
	end
	local job = GetChaAttr(role, ATTR_JOB)
	if job~= 8 then
		SystemNotice( role , "ֻ�о޽�ʿ���ܴ�������ӡ�" )
		UseItemFailed ( role )
		return
	end
	local i=math.random(1,100)
	if i<=25 then
		GiveItem ( role , 0 , 6181 , 1 , 4)
		return
 	elseif i<=50 then
		GiveItem ( role , 0 , 6182 , 1 , 4)
		return
 	elseif i<=75 then
		GiveItem ( role , 0 , 6183 , 1 , 4)
		return
	elseif i<=100 then
		GiveItem ( role , 0 , 6184 , 1 , 4)
		return
	end
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.."������֮�������侪ϲ�ػ��"..itemname  
	Notice ( message )
end

--������ ����������(6259)
function ItemUse_SZGONGZHENG ( role , Item )

	local job = GetChaAttr(role, ATTR_JOB)
	if job~= 16 then
		SystemNotice( role , "ֻ�к���ʿ���ܴ�������ӡ�" )
		UseItemFailed ( role )
		return
	end
	local Cha_Boat = GetCtrlBoat ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"����û���㹻�Ŀռ䣬ʹ����֮��������ʧ��")
		UseItemFailed ( role )
		return
	end
	if Cha_Boat ~=  nil then
		SystemNotice( role , "����ʱ����ʹ��" )
		UseItemFailed ( role )
		return
	end
	local i=math.random(1,100)
	if i<=25 then
		GiveItem ( role , 0 , 6185 , 1 , 4)
		return
 	elseif i<=50 then
		GiveItem ( role , 0 , 6186 , 1 , 4)
		return
 	elseif i<=75 then
		GiveItem ( role , 0 , 6187 , 1 , 4)
		return
	elseif i<=100 then
		GiveItem ( role , 0 , 6188 , 1 , 4)
		return
	end
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.."������֮�������侪ϲ�ػ��"..itemname  
	Notice ( message )
end

--������ ����������(6260)
function ItemUse_SZLIANMING ( role , Item )

	local job = GetChaAttr(role, ATTR_JOB)
	if job~= 13 then
		SystemNotice( role , "ֻ��ʥְ�߲��ܴ�������ӡ�" )
		UseItemFailed ( role )
		return
	end
	local Cha_Boat = GetCtrlBoat ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"����û���㹻�Ŀռ䣬ʹ����֮��������ʧ��")
		UseItemFailed ( role )
		return
	end
	if Cha_Boat ~=  nil then
		SystemNotice( role , "����ʱ����ʹ��" )
		UseItemFailed ( role )
		return
	end
	local i=math.random(1,100)
	if i<=25 then
		GiveItem ( role , 0 , 6189 , 1 , 4)
		return
 	elseif i<=50 then
		GiveItem ( role , 0 , 6190 , 1 , 4)
		return
 	elseif i<=75 then
		GiveItem ( role , 0 , 6191 , 1 , 4)
		return
	elseif i<=100 then
		GiveItem ( role , 0 , 6192 , 1 , 4)
		return
	end
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.."������֮�������侪ϲ�ػ��"..itemname  
	Notice ( message )
end

--������ �����������(6261)
function ItemUse_SZJINGSHENG ( role , Item )

	local job = GetChaAttr(role, ATTR_JOB)
	if job~= 14 then
		SystemNotice( role , "ֻ�з�ӡʦ���ܴ�������ӡ�" )
		UseItemFailed ( role )
		return
	end
	local Cha_Boat = GetCtrlBoat ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"����û���㹻�Ŀռ䣬ʹ����֮������ʧ��")
		UseItemFailed ( role )
		return
	end
	if Cha_Boat ~=  nil then
		SystemNotice( role , "����ʱ����ʹ��" )
		UseItemFailed ( role )
		return
	end
	local i=math.random(1,100)
	if i<=25 then
		GiveItem ( role , 0 , 6193 , 1 , 4)
		return
 	elseif i<=50 then
		GiveItem ( role , 0 , 6194 , 1 , 4)
		return
 	elseif i<=75 then
		GiveItem ( role , 0 , 6195 , 1 , 4)
		return
	elseif i<=100 then
		GiveItem ( role , 0 , 6196 , 1 , 4)
		return
	end
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.."������֮�����侪ϲ�ػ��"..itemname  
	Notice ( message )
end

--������ ������ ������������� ������� �� ������ �(6294)
function ItemUse_CWKPDHBX ( role )

	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"û���㹻�Ŀռ䣬�޷������ӡ�")
		UseItemFailed ( role )
		return
	end

	local cha_name = GetChaDefaultName ( role ) 
	local star=math.random ( 1, 100 )
	--SystemNotice(role ,"star=="..star)
		if star<=10 then
			GiveItem ( role , 0 , 6295  , 1 , 4  )
			local message1 = cha_name.."�򿪶һ�����,�õ��˰��������ٻ�ȯ!" 
			Notice ( message1 )
		elseif star>=10 and star<=20 then
			GiveItem ( role , 0 , 6296  , 1 , 4  )
			local message2 = cha_name.."�򿪶һ�����,�õ��˿ɰ������ٻ�ȯ!" 
			Notice ( message2 )
		elseif star>=21 and star<=30 then
			GiveItem ( role , 0 , 6297  , 1 , 4  )
			local message3 = cha_name.."�򿪶һ�����,�õ�������С���ٻ�ȯ!" 
			Notice ( message3 )
		elseif star>=31 and star<=40 then
			GiveItem ( role , 0 , 6298  , 1 , 4  )
			local message4 = cha_name.."�򿪶һ�����,�õ�������Ů���ٻ�ȯ!" 
			Notice ( message4 )
		elseif star>=41 and star<=50 then
			GiveItem ( role , 0 , 6299  , 1 , 4  )
			local message5 = cha_name.."�򿪶һ�����,�õ��˷����������ٻ�ȯ!" 
			Notice ( message5 )
		elseif star>=51 and star<=60 then
			GiveItem ( role , 0 , 6300  , 1 , 4  )
			local message6 = cha_name.."�򿪶һ�����,�õ��˻ʼ���У�ٻ�ȯ!" 
			Notice ( message6 )
		elseif star>=61 and star<=70 then
			GiveItem ( role , 0 , 6301  , 1 , 4  )
			local message7 = cha_name.."�򿪶һ�����,�õ��˲��������ٻ�ȯ!" 
			Notice ( message7 )
		elseif star>=71 and star<=80 then
			GiveItem ( role , 0 , 6302  , 1 , 4  )
			local message8 = cha_name.."�򿪶һ�����,�õ��˺���սʿ�ٻ�ȯ!" 
			Notice ( message8 )
		elseif star>=81 and star<=90 then
			GiveItem ( role , 0 , 6203  , 1 , 4  )
			local message9 = cha_name.."�򿪶һ�����,�õ�����ˮ�����ٻ�ȯ!" 
			Notice ( message9 )
		elseif star>=91 and star<=100 then
			GiveItem ( role , 0 , 6304  , 1 , 4  )
			local message10 = cha_name.."�򿪶һ�����,�õ���ޢޢ�ٻ�ȯ!" 
			Notice ( message10 )

		end	
end

--������ ������ ���(6295)
function ItemUse_AMXN ( role , Item  )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "���ϲ���ʹ��" )
		UseItemFailed ( role )
		return
	end
	local pet_num = GetPetNum(role)
	if pet_num >= 2 then
		SystemNotice( role , "�������2ֻ,���Ժ����ٻ�!" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	x_resume = 5
	y_resume = 5
	x = x + x_resume
	y = y + y_resume
	local MonsterID = 1126     -------------------�������� 1126
	local Refresh = 3600					--����ʱ�䣬�뵥λ
	local life = 3600000					--����ʱ�䣬���뵥λ
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaHost(new,role)
	SetChaLifeTime( new, life )
	SetChaTarget(new, role)
	PlayEffect( new, 361 )
end

--������ ������ �����(6296)
function ItemUse_AMKALL ( role , Item  )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "���ϲ���ʹ��" )
		UseItemFailed ( role )
		return
	end
	local pet_num = GetPetNum(role)
	if pet_num >= 2 then
		SystemNotice( role , "�������2ֻ,���Ժ����ٻ�!" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	x_resume = 5
	y_resume = 5
	x = x + x_resume
	y = y + y_resume
	local MonsterID = 1127     -------------------�ɰ����� 1127
	local Refresh = 3600					--����ʱ�䣬�뵥λ
	local life = 3600000					--����ʱ�䣬���뵥λ
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaHost(new,role)
	SetChaLifeTime( new, life )
	SetChaTarget(new, role)
	PlayEffect( new, 361 )
end


--������ ������ ������ ������(6297)
function ItemUse_AMNSXM ( role , Item  )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "���ϲ���ʹ��" )
		UseItemFailed ( role )
		return
	end
	local pet_num = GetPetNum(role)
	if pet_num >= 2 then
		SystemNotice( role , "�������2ֻ,���Ժ����ٻ�!" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	x_resume = 5
	y_resume = 5
	x = x + x_resume
	y = y + y_resume
	local MonsterID = 1128     -------------------����С�� 1128
	local Refresh = 3600					--����ʱ�䣬�뵥λ
	local life = 3600000					--����ʱ�䣬���뵥λ
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaHost(new,role)
	SetChaLifeTime( new, life )
	SetChaTarget(new, role)
	PlayEffect( new, 361 )
end


--������ ������ �������� ����(6298)
function ItemUse_FLELYNH ( role , Item  )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "���ϲ���ʹ��" )
		UseItemFailed ( role )
		return
	end
	local pet_num = GetPetNum(role)
	if pet_num >= 2 then
		SystemNotice( role , "�������2ֻ,���Ժ����ٻ�!" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	x_resume = 5
	y_resume = 5
	x = x + x_resume
	y = y + y_resume
	local MonsterID = 1129     -------------------����Ů�� 1129
	local Refresh = 3600					--����ʱ�䣬�뵥λ
	local life = 3600000					--����ʱ�䣬���뵥λ
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaHost(new,role)
	SetChaLifeTime( new, life )
	SetChaTarget(new, role)
	PlayEffect( new, 361 )
end


--������ ������ ������(6299)
function ItemUse_FLEXN ( role , Item  )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "���ϲ���ʹ��" )
		UseItemFailed ( role )
		return
	end
	local pet_num = GetPetNum(role)
	if pet_num >= 2 then
		SystemNotice( role , "�������2ֻ,���Ժ����ٻ�!" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	x_resume = 5
	y_resume = 5
	x = x + x_resume
	y = y + y_resume
	local MonsterID = 1130     -------------------���������� 1130
	local Refresh = 3600					--����ʱ�䣬�뵥λ
	local life = 3600000					--����ʱ�䣬���뵥λ
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaHost(new,role)
	SetChaLifeTime( new, life )
	SetChaTarget(new, role)
	PlayEffect( new, 361 )
end


--������ ������ ������ �����������(6300)
function ItemUse_FLEHJSX ( role , Item  )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "���ϲ���ʹ��" )
		UseItemFailed ( role )
		return
	end
	local pet_num = GetPetNum(role)
	if pet_num >= 2 then
		SystemNotice( role , "�������2ֻ,���Ժ����ٻ�!" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	x_resume = 5
	y_resume = 5
	x = x + x_resume
	y = y + y_resume
	local MonsterID = 1131     -------------------�ʼ���У 1131
	local Refresh = 3600					--����ʱ�䣬�뵥λ
	local life = 3600000					--����ʱ�䣬���뵥λ
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaHost(new,role)
	SetChaLifeTime( new, life )
	SetChaTarget(new, role)
	PlayEffect( new, 361 )
end

--������ ������ ������ �����(6301)
function ItemUse_LQBKSS ( role , Item  )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "���ϲ���ʹ��" )
		UseItemFailed ( role )
		return
	end
	local pet_num = GetPetNum(role)
	if pet_num >= 2 then
		SystemNotice( role , "�������2ֻ,���Ժ����ٻ�!" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	x_resume = 5
	y_resume = 5
	x = x + x_resume
	y = y + y_resume
	local MonsterID = 1132     -------------------�������� 1132
	local Refresh = 3600					--����ʱ�䣬�뵥λ
	local life = 3600000					--����ʱ�䣬���뵥λ
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaHost(new,role)
	SetChaLifeTime( new, life )
	SetChaTarget(new, role)
	PlayEffect( new, 361 )
end


--������ ������ �����-���������(6302)
function ItemUse_KXSHKZS ( role , Item  )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "���ϲ���ʹ��" )
		UseItemFailed ( role )
		return
	end
	local pet_num = GetPetNum(role)
	if pet_num >= 2 then
		SystemNotice( role , "�������2ֻ,���Ժ����ٻ�!" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	x_resume = 5
	y_resume = 5
	x = x + x_resume
	y = y + y_resume
	local MonsterID = 1133     -------------------����սʿ 1133
	local Refresh = 3600					--����ʱ�䣬�뵥λ
	local life = 3600000					--����ʱ�䣬���뵥λ
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaHost(new,role)
	SetChaLifeTime( new, life )
	SetChaTarget(new, role)
	PlayEffect( new, 361 )
end

--������ ������ �������� ������ ���������(6303)
function ItemUse_CWSSBW ( role , Item  )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "���ϲ���ʹ��" )
		UseItemFailed ( role )
		return
	end
	local pet_num = GetPetNum(role)
	if pet_num >= 2 then
		SystemNotice( role , "�������2ֻ,���Ժ����ٻ�!" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	x_resume = 5
	y_resume = 5
	x = x + x_resume
	y = y + y_resume
	local MonsterID = 1134     -------------------��ˮ���� 1134
	local Refresh = 3600					--����ʱ�䣬�뵥λ
	local life = 3600000					--����ʱ�䣬���뵥λ
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaHost(new,role)
	SetChaLifeTime( new, life )
	SetChaTarget(new, role)
	PlayEffect( new, 361 )
end

--������ ������ ����������(6304)
function ItemUse_CWKK( role , Item  )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "���ϲ���ʹ��" )
		UseItemFailed ( role )
		return
	end
	local pet_num = GetPetNum(role)
	if pet_num >= 2 then
		SystemNotice( role , "�������2ֻ,���Ժ����ٻ�!" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	x_resume = 5
	y_resume = 5
	x = x + x_resume
	y = y + y_resume
	local MonsterID = 1135     -------------------ޢޢ 1135
	local Refresh = 3600					--����ʱ�䣬�뵥λ
	local life = 3600000					--����ʱ�䣬���뵥λ
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaHost(new,role)
	SetChaLifeTime( new, life )
	SetChaTarget(new, role)
	--PlayEffect( new, 361 )
end

--������ ������ �������� ������� �������(6305)
function ItemUse_CWHLBB( role , Item  )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "���ϲ���ʹ��" )
		UseItemFailed ( role )
		return
	end
	local pet_num = GetPetNum(role)
	if pet_num >= 2 then
		SystemNotice( role , "�������2ֻ,���Ժ����ٻ�!" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	x_resume = 5
	y_resume = 5
	x = x + x_resume
	y = y + y_resume
	local MonsterID = 1136     -------------------�������� 1136
	local Refresh = 3600					--����ʱ�䣬�뵥λ
	local life = 3600000					--����ʱ�䣬���뵥λ
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaHost(new,role)
	SetChaLifeTime( new, life )
	SetChaTarget(new, role)
	PlayEffect( new, 361 )
end

--������ �� ���� ������ � ����
function ItemUse_GMJP(role, Item )
   local i = CheckBagItem(role,7078)
   local k = ChaIsBoat(role)
   local hp = Hp(role)
   local mxhp = Mxhp(role)
   local sp = Sp(role)
   local mxsp = Mxsp(role)
   if sp < mxsp or hp < mxhp then
	SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
	--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")

      UseItemFailed ( role )
      return
   end

   local map_name = GetChaMapName ( role )
   if map_name == "Pkteam" then
	SystemNotice ( role , "\194\251 \237\224\245\238\228\232\242\229\241\252 \226 \242\254\240\252\236\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \225\232\235\229\242" )
                  --SystemNotice ( role , "�� ���������� � ������. ���������� ������������ �����" )

      UseItemFailed ( role )
      return
   end

   if k == 0 then
      if i > 0 then
         local j = DelBagItem(role,7078,1)
         if j == 1 then
            MoveCity(role,"mjing1")
            return
         end
      end
   else
      UseItemFailed ( role )
   end
      
end

function ItemUse_HAJP(role, Item )
   local i = CheckBagItem(role,7079)
   local k = ChaIsBoat(role)
   local hp = Hp(role)
   local mxhp = Mxhp(role)
   local sp = Sp(role)
   local mxsp = Mxsp(role)
   if sp < mxsp or hp < mxhp then
	SystemNotice (role, "\210\229\235\229\239\238\240\242\224\246\232\255 \238\247\229\237\252 \243\242\238\236\232\242\229\235\252\237\251\233 \239\240\238\246\229\241\241. \207\238\230\224\235\243\233\241\242\224, \226\238\241\241\242\224\237\238\226\232\242\229 \194\224\248\229 \231\228\238\240\238\226\252\229 \232 \236\224\237\243")
	--SystemNotice (role, "������������ ����� ������������ �������. ����������, ������������ ���� �������� � ����")
      UseItemFailed ( role )
      return
   end

   local map_name = GetChaMapName ( role )
   if map_name == "Pkteam" then
	SystemNotice ( role , "\194\251 \237\224\245\238\228\232\242\229\241\252 \226 \242\254\240\252\236\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \225\232\235\229\242" )
                  --SystemNotice ( role , "�� ���������� � ������. ���������� ������������ �����" )

      UseItemFailed ( role )
      return
   end

   if k == 0 then
      if i > 0 then
         local j = DelBagItem(role,7079,1)
         if j == 1 then
            MoveCity(role,"mjing3")
            return
         end
      end
   else
      UseItemFailed ( role )
   end
      
end

function ItemUse_mini ( role , Item , Item_Traget ) 

    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
--    SystemNotice( role , Cha_Boat )
    if Cha_Boat ~= nil then 
        SystemNotice( role , "Cannot use while sailing" ) 
        UseItemFailed ( role ) 
        return 
    end 
        local Item_type = GetItemType ( Item )
        local Item_Traget_Type = GetItemType ( Item_Traget )
        local Item_Num = GetItemID ( Item )
        local Check_Exp = 0
        local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 
        --SystemNotice(role ,Elf_MaxEXP )

        if Item_type == 58 and Item_Traget_Type == 59 then
                Check_Exp = CheckElf_EXP ( role , Item_Traget ) --����exp�Ƿ�������������
                if Check_Exp == 0 then
                    SystemNotice(role , "Growth rate is not full. Unable to feed pet with Snow Dragon Fruit" ) 
                    UseItemFailed ( role )
                else
                   Lvup_Str_2 ( role , Item_Num , Item_Traget ) --���ݾ������ѡ��ͬ���Եĳɳ����� ( ����Ϊstr )
                end 
        end 
end

function ItemUse_minq ( role , Item , Item_Traget ) 

    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
--    SystemNotice( role , Cha_Boat )
    if Cha_Boat ~= nil then 
        SystemNotice( role , "Cannot use while sailing" ) 
        UseItemFailed ( role ) 
        return 
    end 
        local Item_type = GetItemType ( Item )
        local Item_Traget_Type = GetItemType ( Item_Traget )
        local Item_Num = GetItemID ( Item )
        local Check_Exp = 0
        local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 
        --SystemNotice(role ,Elf_MaxEXP )

        if Item_type == 58 and Item_Traget_Type == 59 then
                Check_Exp = CheckElf_EXP ( role , Item_Traget ) --����exp�Ƿ�������������
                if Check_Exp == 0 then
                    SystemNotice(role , "Growth rate is not full. Unable to feed pet with Snow Dragon Fruit" ) 
                    UseItemFailed ( role )
                else
                   Lvup_Agi_2 ( role , Item_Num , Item_Traget ) --���ݾ������ѡ��ͬ���Եĳɳ����� ( ����Ϊstr )
                end 
        end 
end

function ItemUse_minw ( role , Item , Item_Traget ) 

    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
--    SystemNotice( role , Cha_Boat )
    if Cha_Boat ~= nil then 
        SystemNotice( role , "Cannot use while sailing" ) 
        UseItemFailed ( role ) 
        return 
    end 
        local Item_type = GetItemType ( Item )
        local Item_Traget_Type = GetItemType ( Item_Traget )
        local Item_Num = GetItemID ( Item )
        local Check_Exp = 0
        local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 
        --SystemNotice(role ,Elf_MaxEXP )

        if Item_type == 58 and Item_Traget_Type == 59 then
                Check_Exp = CheckElf_EXP ( role , Item_Traget ) --����exp�Ƿ�������������
                if Check_Exp == 0 then
                    SystemNotice(role , "Growth rate is not full. Unable to feed pet with Snow Dragon Fruit" ) 
                    UseItemFailed ( role )
                else
                   Lvup_Dex_2 ( role , Item_Num , Item_Traget ) --���ݾ������ѡ��ͬ���Եĳɳ����� ( ����Ϊstr )
                end 
        end 
end


function ItemUse_mine ( role , Item , Item_Traget ) 

    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
--    SystemNotice( role , Cha_Boat )
    if Cha_Boat ~= nil then 
        SystemNotice( role , "Cannot use while sailing" ) 
        UseItemFailed ( role ) 
        return 
    end 
        local Item_type = GetItemType ( Item )
        local Item_Traget_Type = GetItemType ( Item_Traget )
        local Item_Num = GetItemID ( Item )
        local Check_Exp = 0
        local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 
        --SystemNotice(role ,Elf_MaxEXP )

        if Item_type == 58 and Item_Traget_Type == 59 then
                Check_Exp = CheckElf_EXP ( role , Item_Traget ) --����exp�Ƿ�������������
                if Check_Exp == 0 then
                    SystemNotice(role , "Growth rate is not full. Unable to feed pet with Snow Dragon Fruit" ) 
                    UseItemFailed ( role )
                else
                   Lvup_Con_2 ( role , Item_Num , Item_Traget ) --���ݾ������ѡ��ͬ���Եĳɳ����� ( ����Ϊstr )
                end 
        end 
end


function ItemUse_minr ( role , Item , Item_Traget ) 

    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
--    SystemNotice( role , Cha_Boat )
    if Cha_Boat ~= nil then 
        SystemNotice( role , "Cannot use while sailing" ) 
        UseItemFailed ( role ) 
        return 
    end 
        local Item_type = GetItemType ( Item )
        local Item_Traget_Type = GetItemType ( Item_Traget )
        local Item_Num = GetItemID ( Item )
        local Check_Exp = 0
        local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 
        --SystemNotice(role ,Elf_MaxEXP )

        if Item_type == 58 and Item_Traget_Type == 59 then
                Check_Exp = CheckElf_EXP ( role , Item_Traget ) --����exp�Ƿ�������������
                if Check_Exp == 0 then
                    SystemNotice(role , "Growth rate is not full. Unable to feed pet with Snow Dragon Fruit" ) 
                    UseItemFailed ( role )
                else
                   Lvup_Sta_2 ( role , Item_Num , Item_Traget ) --���ݾ������ѡ��ͬ���Եĳɳ����� ( ����Ϊstr )
                end 
        end 
end

function ItemUse_bog ( role , Item , Item_Traget ) 

    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
--    SystemNotice( role , Cha_Boat )
    if Cha_Boat ~= nil then 
        SystemNotice( role , "Cannot use while sailing" ) 
        UseItemFailed ( role ) 
        return 
    end 
        local Item_type = GetItemType ( Item )
        local Item_Traget_Type = GetItemType ( Item_Traget )
        local Item_Num = GetItemID ( Item )
        local Check_Exp = 0
        local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 
        --SystemNotice(role ,Elf_MaxEXP )

        if Item_type == 58 and Item_Traget_Type == 59 then
                Check_Exp = CheckElf_EXP ( role , Item_Traget ) --����exp�Ƿ�������������
                if Check_Exp == 0 then
                    SystemNotice(role , "Growth rate is not full. Unable to feed pet with Snow Dragon Fruit" ) 
                    UseItemFailed ( role )
                else
                   Lvup_Str_3 ( role , Item_Num , Item_Traget ) --���ݾ������ѡ��ͬ���Եĳɳ����� ( ����Ϊstr )
                end 
        end 
end

function ItemUse_boq ( role , Item , Item_Traget ) 

    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
--    SystemNotice( role , Cha_Boat )
    if Cha_Boat ~= nil then 
        SystemNotice( role , "Cannot use while sailing" ) 
        UseItemFailed ( role ) 
        return 
    end 
        local Item_type = GetItemType ( Item )
        local Item_Traget_Type = GetItemType ( Item_Traget )
        local Item_Num = GetItemID ( Item )
        local Check_Exp = 0
        local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 
        --SystemNotice(role ,Elf_MaxEXP )

        if Item_type == 58 and Item_Traget_Type == 59 then
                Check_Exp = CheckElf_EXP ( role , Item_Traget ) --����exp�Ƿ�������������
                if Check_Exp == 0 then
                    SystemNotice(role , "Growth rate is not full. Unable to feed pet with Snow Dragon Fruit" ) 
                    UseItemFailed ( role )
                else
                   Lvup_Agi_3 ( role , Item_Num , Item_Traget ) --���ݾ������ѡ��ͬ���Եĳɳ����� ( ����Ϊstr )
                end 
        end 
end

function ItemUse_bow ( role , Item , Item_Traget ) 

    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
--    SystemNotice( role , Cha_Boat )
    if Cha_Boat ~= nil then 
        SystemNotice( role , "Cannot use while sailing" ) 
        UseItemFailed ( role ) 
        return 
    end 
        local Item_type = GetItemType ( Item )
        local Item_Traget_Type = GetItemType ( Item_Traget )
        local Item_Num = GetItemID ( Item )
        local Check_Exp = 0
        local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 
        --SystemNotice(role ,Elf_MaxEXP )

        if Item_type == 58 and Item_Traget_Type == 59 then
                Check_Exp = CheckElf_EXP ( role , Item_Traget ) --����exp�Ƿ�������������
                if Check_Exp == 0 then
                    SystemNotice(role , "Growth rate is not full. Unable to feed pet with Snow Dragon Fruit" ) 
                    UseItemFailed ( role )
                else
                   Lvup_Dex_3 ( role , Item_Num , Item_Traget ) --���ݾ������ѡ��ͬ���Եĳɳ����� ( ����Ϊstr )
                end 
        end 
end

function ItemUse_boe ( role , Item , Item_Traget ) 

    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
--    SystemNotice( role , Cha_Boat )
    if Cha_Boat ~= nil then 
        SystemNotice( role , "Cannot use while sailing" ) 
        UseItemFailed ( role ) 
        return 
    end 
        local Item_type = GetItemType ( Item )
        local Item_Traget_Type = GetItemType ( Item_Traget )
        local Item_Num = GetItemID ( Item )
        local Check_Exp = 0
        local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 
        --SystemNotice(role ,Elf_MaxEXP )

        if Item_type == 58 and Item_Traget_Type == 59 then
                Check_Exp = CheckElf_EXP ( role , Item_Traget ) --����exp�Ƿ�������������
                if Check_Exp == 0 then
                    SystemNotice(role , "Growth rate is not full. Unable to feed pet with Snow Dragon Fruit" ) 
                    UseItemFailed ( role )
                else
                   Lvup_Con_3 ( role , Item_Num , Item_Traget ) --���ݾ������ѡ��ͬ���Եĳɳ����� ( ����Ϊstr )
                end 
        end 
end

function ItemUse_bor ( role , Item , Item_Traget ) 

    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
--    SystemNotice( role , Cha_Boat )
    if Cha_Boat ~= nil then 
        SystemNotice( role , "Cannot use while sailing" ) 
        UseItemFailed ( role ) 
        return 
    end 
        local Item_type = GetItemType ( Item )
        local Item_Traget_Type = GetItemType ( Item_Traget )
        local Item_Num = GetItemID ( Item )
        local Check_Exp = 0
        local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 
        --SystemNotice(role ,Elf_MaxEXP )

        if Item_type == 58 and Item_Traget_Type == 59 then
                Check_Exp = CheckElf_EXP ( role , Item_Traget ) --����exp�Ƿ�������������
                if Check_Exp == 0 then
                    SystemNotice(role , "Growth rate is not full. Unable to feed pet with Snow Dragon Fruit" ) 
                    UseItemFailed ( role )
                else
                   Lvup_Sta_3 ( role , Item_Num , Item_Traget ) --���ݾ������ѡ��ͬ���Եĳɳ����� ( ����Ϊstr )
                end 
        end 
end

function ItemUse_HighExpGzLv3A( role , Item )
	local Lv = Lv( role )
	if Lv < 70 then
		SystemNotice(role ,"����� ������������ ���� 70 ��� ")
		UseItemFailed ( role )
		return
	end

	local statelv = 4
	
	local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
	
	if ChaStateLv > statelv then
		SystemNotice ( role , "������� ������ ��� �� ������." )
		UseItemFailed ( role )
		return
	end
	
	local statetime = 1800
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBJYGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBJYGZ , statelv , statetime )
	end
	SystemNotice ( role ,"������ �������� " )
end

--3x5 Amplifier of Strive

function ItemUse_MoreExpGzLv3x5A( role , Item )
		local Lv = Lv( role )
		if Lv < 300 then
		SystemNotice(role ,"\210\238\235\252\234\238 \232\227\240\238\234\232 \243\240\238\226\237\255 300 \232 \226\251\248\229 \236\238\227\243\242 \232\241\239\238\235\252\231\238\226\224\242\252 \194\229\235\232\234\232\233 \211\241\232\235\232\242\229\235\252 \209\242\240\229\236\235\229\237\232\233")
		--SystemNotice(role ,"������ ������ ������ 60 � ���� ����� ������������ ����� ��������� ����������")
		--SystemNotice(role ,"Only Lv 60 and above may use")
		UseItemFailed ( role )
		return
	end

	local statelv = 5
    local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
    if ChaStateLv >= statelv then
        SystemNotice ( role , "����� ����������� ��� ����������� ��������� ����� ��� ������������" )
        UseItemFailed ( role )
        return
    end
    local statetime = 600
    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
    if Cha_Boat ==  nil then
        AddState( role , role , STATE_SBJYGZ , statelv , statetime )
    else
        AddState( Cha_Boat , Cha_Boat , STATE_SBJYGZ , statelv , statetime )
    end
    SystemNotice ( role ,"\207\238\235\243\247\224\229\236\251\233 \238\239\251\242 \243\226\229\235\232\247\229\237 \226 3.5 \240\224\231\224 " )
	local effect = 943              -- ID ������� �� sceneffectinfo.txt
    PlayEffect (role, effect )      -- ���������� ����������� ������ ��� �������� �������
end

--4x Amplifier of Strive

function ItemUse_MoreExpGzLv4A( role , Item )
		local Lv = Lv( role )
		if Lv < 600 then
		SystemNotice(role ,"\210\238\235\252\234\238 \232\227\240\238\234\232 \243\240\238\226\237\255 600 \232 \226\251\248\229 \236\238\227\243\242 \232\241\239\238\235\252\231\238\226\224\242\252 \203\229\227\229\237\228\224\240\237\251\233 \211\241\232\235\232\242\229\235\252 \209\242\240\229\236\235\229\237\232\233")
		--SystemNotice(role ,"������ ������ ������ 60 � ���� ����� ������������ ����� ��������� ����������")
		--SystemNotice(role ,"Only Lv 60 and above may use")
		UseItemFailed ( role )
		return
	end

	local statelv = 6
    local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
    if ChaStateLv >= statelv then
        SystemNotice ( role , "����� ����������� ��� ����������� ��������� ����� ��� ������������" )
        UseItemFailed ( role )
        return
    end
    local statetime = 600
    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
    if Cha_Boat ==  nil then
        AddState( role , role , STATE_SBJYGZ , statelv , statetime )
    else
        AddState( Cha_Boat , Cha_Boat , STATE_SBJYGZ , statelv , statetime )
    end
    SystemNotice ( role ,"\207\238\235\243\247\224\229\236\251\233 \238\239\251\242 \243\226\229\235\232\247\229\237 \226 4 \240\224\231\224 " )
	local effect = 943              -- ID ������� �� sceneffectinfo.txt
    PlayEffect (role, effect )      -- ���������� ����������� ������ ��� �������� �������
end

function ItemUse_MoreItemGzLv4B( role , Item )
	local Lv = Lv( role )
	if Lv < 80 then
		SystemNotice(role ,"����� ������������ ���� 80 ��� ")
		UseItemFailed ( role )
		return
	end


	local statelv = 6
	
	local ChaStateLv = GetChaStateLv ( role , STATE_SBBLGZ )
	
	if ChaStateLv > statelv then
		SystemNotice ( role , "������� ������ ��� �� ������." )
		UseItemFailed ( role )
		return
	end

	local statetime = 1800
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBBLGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBBLGZ , statelv , statetime )
	end
	SystemNotice ( role ,"������ ������� " )
end


function ItemUse_raritybox (role, Item)

	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "����ʱ����ʹ��85����װ����" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	 if Item_CanGet < 1 then
		SystemNotice(role ,"��85����װ����������Ҫ1����λ")
		UseItemFailed ( role )
		return
	end
	
	local job = GetChaAttr( role, ATTR_JOB) --ȡְҵ
	local cha_type = GetChaTypeID ( role )
	local itemname = ""
	if cha_type ~= 2 and job==4 then
		GiveItem ( role , 0 , 2580 , 1 , 4 )--------------����֮����
		itemname = "����֮����"
	elseif cha_type ~= 2 and job==16 then
		GiveItem ( role , 0 , 2580 , 1 , 4 )--------------����֮����
		itemname = "����֮����"
	elseif cha_type == 2  and job~=0 then
		GiveItem ( role , 0 , 2577 , 1 , 4 )----------------����˹֮ǿ��
		itemname = "����˹֮ǿ��"
	elseif cha_type ~= 2 and  cha_type ~= 4 and job==2 then
		GiveItem ( role , 0 , 2579  , 1 , 4 )-----------------����֮����
		itemname = "����֮����"
	elseif cha_type ~= 2 and  cha_type ~= 4 and job==12 then
		GiveItem ( role , 0 , 2579  , 1 , 4 )-----------------����֮����
		itemname = "����֮����"
	elseif cha_type ~= 1 and  cha_type ~= 2 and job==5 then
		local dina=math.random ( 1, 2 )
	if dina==1 then
		GiveItem ( role , 0 , 2582  , 1 , 4 )------------��ڤ֮����
		itemname = "��ڤ֮����"
	else
		GiveItem ( role , 0 , 2581  , 1 , 4 )-------------ڤ��֮ħ��
		itemname = "ڤ��֮ħ��"
	end
	elseif cha_type ~= 1 and  cha_type ~= 2 and job==13 then
		GiveItem ( role , 0 , 2582  , 1 , 4 )------------��ڤ֮����
		itemname = "ڤ��֮����"
	elseif cha_type ~= 1 and  cha_type ~= 2 and job==14 then
		GiveItem ( role , 0 , 2581  , 1 , 4 )-------------ڤ��֮ħ��
		itemname = "ڤ��֮ħ��"
	elseif cha_type == 1 and  job==1 then
		GiveItem ( role , 0 , 2578  , 1 , 4 )-------------�ڰ�֮����
		itemname = "�ڰ�֮����"
	elseif cha_type == 1 and  job==9 then
		GiveItem ( role , 0 , 2578  , 1 , 4 )-------------�ڰ�֮����
		itemname = "�ڰ�֮����"
	elseif cha_type == 3 and  job==1 then
		GiveItem ( role , 0 , 2578  , 1 , 4 )-------------�ڰ�֮����
		itemname = "�ڰ�֮����"
	elseif cha_type == 3 and  job==9 then
		GiveItem ( role , 0 , 2578  , 1 , 4 )-------------�ڰ�֮����
		itemname = "�ڰ�֮����"
	else 
		SystemNotice(role ,"Ŀǰ����ʹ�ã����Ҹ���ְҵ��ʦתְ.")
		UseItemFailed ( role )
		return
	end
	local cha_name = GetChaDefaultName ( role )
	Notice ( "��ϲ���" ..cha_name.."��85����װ����,��ϲ�Ļ��"..itemname )
end

----------------------------------�Ͼ����� --------------------------------------------------------------
function ItemUse_purplebox (role, Item)

	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	 if Item_CanGet < 1 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224 ")
		UseItemFailed ( role )
		return
	end
	local i= CheckBagItem( role, 5702 )                                                
	if i <=0 then
		SystemNotice(  role , "\211 \226\224\241 \237\229\242\243 \234\235\254\247\224")
		UseItemFailed ( role )
		return LUA_FALSE
	end
	
	local s = DelBagItem ( role , 5702 , 1 ) 
	local	sc = math.random(1,100)
	local itemname = ""
	if  sc <=10 then	
		GiveItem ( role , 0 , 5711 , 1 , 4 )                    ---------------������ ������� �������
		itemname = "\209\243\237\228\243\234 \199\229\235\184\237\238\227\238 \196\240\224\234\238\237\224"
	elseif sc <=20 then		
		GiveItem ( role , 0 , 3087 , 3 , 4 )                    ---------------��˲ر�ͼ   ��û���40%
		itemname = "\198\240\229\225\232\233 \212\238\240\242\243\237\251 (3\248\242)"
	elseif sc <=30 then
		GiveItem ( role , 0 ,5703 , 1 , 4 )                    ---------------����Կ��   ��û���5%
		itemname = "\202\235\254\247 \199\229\235\184\237\238\227\238 \196\240\224\234\238\237\224"
	elseif sc <=40 then
		GiveItem ( role , 0 ,578 , 1 , 4 )                    ---------------Ǭ������   ��û���3%
		itemname = "\212\240\243\234\242 \240\238\241\242\224 \212\229\232"
	elseif sc <=50 then
		GiveItem ( role , 0 ,3087 , 1 , 4 )                    ---------------����Կ��   ��û���5%
		itemname = "\198\240\229\225\232\233 \212\238\240\242\243\237\251 (1\248\242) "
	elseif sc <=60 then
		GiveItem ( role , 0 ,7625 , 1 , 4 )                    ---------------����Կ��   ��û���5%
		itemname = "10 \208\229\239\243\242\224\246\232\232"
	elseif sc <=70 then
		GiveItem ( role , 0 , 3087 , 2 , 4 )                   ---------------��У֮��   ��û���2%
		itemname = "\198\240\229\225\232\233 \212\238\240\242\243\237\251 (2\248\242)"
	elseif sc <=80 then
		GiveItem ( role , 0 ,3087 , 1 , 4 )                    ---------------Ǭ������   ��û���3%
		itemname = "\198\240\229\225\232\233 \212\238\240\242\243\237\251 "
	elseif sc <=90 then
		GiveItem ( role , 0 , 3087 , 2 , 4 )                   ---------------��У֮��   ��û���2%
		itemname = "\198\240\229\225\232\233 \212\238\240\242\243\237\251 (2\248\242)"
	elseif sc <=100 then
		GiveItem ( role , 0 , 7482 , 1 , 4 )                   ---------------��У֮��   ��û���2%
		itemname = "\209\243\237\228\243\234 \211\235\243\247\248\229\237\232\255 \221\234\232\239\232\240\238\226\234\232 "
	end
	local cha_name = GetChaDefaultName ( role )
	--Notice ( "\200\227\240\238\234 " ..cha_name.. " \238\242\234\240\251\235 \239\243\240\239\243\240\237\251\233 \241\243\237\228\243\234,\232 \239\238\235\243\247\232\235 "..itemname )
end

----------------------------------�������� --------------------------------------------------------------
function ItemUse_greenbox (role, Item)

	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	 if Item_CanGet < 1 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224 ")
		UseItemFailed ( role )
		return
	end
	local i= CheckBagItem( role, 5703 )                                                
	if i <=0 then
		SystemNotice(  role , "\211 \226\224\241 \237\229\242\243 \234\235\254\247\224")
		UseItemFailed ( role )
		return LUA_FALSE
	end
	
	local s = DelBagItem ( role , 5703 , 1 ) 
	local	sc = math.random(1,100)
	local itemname = ""
	if  sc <=10 then	
		GiveItem ( role , 0 , 5712 , 1 , 4 )                    ---------------��������   ��û���30%
		itemname = "\209\243\237\228\243\234 \215\229\240\237\238\227\238 \196\240\224\234\238\237\224"
	elseif sc <=20 then		
		GiveItem ( role , 0 , 7622 , 1 , 4 )                    ---------------Ǭ������   ��û���20%
		itemname = "50 \208\229\239\243\242\224\246\232\232"
	elseif sc <=30 then
		GiveItem ( role , 0 ,578 , 2 , 4 )                    ---------------����  ��û���15%
		itemname = "\212\240\243\234\242 \208\238\241\242\224 \212\229\232 (2\248\242)"
	elseif sc <=40 then
		GiveItem ( role , 0 ,3087 , 3 , 4 )                    ---------------����   ��û���15%
		itemname = "\198\240\229\225\232\233 \212\238\240\242\243\237\251 (3\248\242)"
	elseif sc <=50 then
		GiveItem ( role , 0 ,7496 , 1 , 4 )                    ---------------����   ��û���13%
		itemname = "\204\229\248\238\234 \241 \212\240\243\234\242\238\236 \212\229\232"
	elseif sc <=60 then
		GiveItem ( role , 0 ,5704 , 1 , 4 )                    ---------------����Կ��   ��û���5%
		itemname = "\202\235\254\247 \215\229\240\237\238\227\238 \196\240\224\234\238\237\224"
	elseif sc <=70 then
		GiveItem ( role , 0 ,7528 , 2 , 4 )                    ---------------����Կ��   ��û���5%
		itemname = "\215\224\241\242\252 \207\235\224\249\224 (2\248\242)"
	elseif sc <=80 then
		GiveItem ( role , 0 , 7482 , 2 , 4 )                   ---------------��У֮��   ��û���2%
		itemname = "\209\243\237\228\243\234 \211\235\243\247\248\229\237\232\255 \221\234\232\239\232\240\238\226\234\232 (2\248\242)"
	elseif sc <=90 then
		GiveItem ( role , 0 ,3087 , 3 , 4 )                    ---------------����Կ��   ��û���5%
		itemname = "\198\240\229\225\232\233 \212\238\240\242\243\237\251 (3\248\242) "
	elseif sc <=100 then
		GiveItem ( role , 0 ,7484 , 1 , 4 )                    ---------------����Կ��   ��û���5%
		itemname = "\209\226\232\242\238\234 \211\228\224\247\232 "
	end
	local cha_name = GetChaDefaultName ( role )
	--Notice ( "\200\227\240\238\234 " ..cha_name.." \238\242\234\240\251\235 \241\243\237\228\243\234 \231\229\235\184\237\238\227\238 \228\240\224\234\238\237\224,\232 \239\238\235\243\247\232\235 "..itemname )
end

----------------------------------�������� --------------------------------------------------------------
function ItemUse_turebox (role, Item)

	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	 if Item_CanGet < 1 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224")
		UseItemFailed ( role )
		return
	end
	local i= CheckBagItem( role, 5704 )                                                
	if i <=0 then
		SystemNotice(  role , "\211 \226\224\241 \237\229\242\243 \234\235\254\247\224")
		UseItemFailed ( role )
		return LUA_FALSE
	end
	local s = DelBagItem ( role , 5704 , 1 ) 
	local	sc = math.random(1,100)
	local itemname = ""
	if	sc <=10 then	
		GiveItem ( role , 0 , 5705 , 1 , 4 )                    ---------------Ů��������ʽ   ��û���38%
		itemname = "\202\235\254\247 \207\240\229\228\229\235\224 "
	elseif sc <=20 then		
		GiveItem ( role , 0 , 5713 , 1 , 4 )                    ---------------������   ��û���20%
		itemname = "\209\243\237\228\243\234 \207\240\229\228\229\235\224"
	elseif sc <=30 then
		GiveItem ( role , 0 ,7622 , 1 , 4 )                    ---------------�ɳ����   ��û���19%
		itemname = "100 \208\229\239\243\242\224\246\232\232 "
	elseif sc <=40 then
		GiveItem ( role , 0 ,7502, 1 , 4 )                    ---------------���������ٻ�ȯ   ��û���15%
		itemname = "\194\229\235\232\234\232\233 \209\226\232\242\238\234 \211\228\224\247\232 "
	elseif sc <=50 then
		GiveItem ( role , 0 ,3087, 4 , 4 )                    ---------------���������ٻ�ȯ   ��û���15%
		itemname = "\198\240\229\225\232\233 \212\238\240\242\243\237\251 (4\248\242) "
	elseif sc <=60 then
		GiveItem ( role , 0 ,7528 , 3 , 4 )                    ---------------����Կ��   ��û���5%
		itemname = "\215\224\241\242\252 \207\235\224\249\224 (3\248\242)"
	elseif sc <=70 then
		GiveItem ( role , 0 , 578 , 5 , 4 )                   ---------------��У֮��   ��û���2%
		itemname = "\212\240\243\234\242 \208\238\241\242\224 \212\229\233 (5\248\242)"
	elseif sc <=80 then
		GiveItem ( role , 0 , 3087 , 5 , 4 )                   ---------------��У֮��   ��û���2%
		itemname = "\198\240\229\225\232\233 \212\238\240\242\243\237\251 (5\248\242)"
	elseif sc <=90 then
		GiveItem ( role , 0 , 7620 , 1 , 4 )                   ---------------��У֮��   ��û���2%
		itemname = "\240\224\241\239\232\241\234\243 \237\224 \241\224\236\238\246\226\229\242 +20"
	elseif sc <=100 then
		GiveItem ( role , 0 , 7482 , 3 , 4 )                   ---------------��У֮��   ��û���2%
		itemname = "\209\243\237\228\243\234 \211\235\243\247\248\229\237\232\255 \221\234\232\239\232\240\238\226\234\232 (3\248\242)"
	end
	local cha_name = GetChaDefaultName ( role )
	--Notice ( "\200\227\240\238\234 " ..cha_name.." \206\242\234\240\251\235 \209\243\237\228\243\234 \215\184\240\237\238\227\238 \196\240\224\234\238\237\224 \232 \239\238\235\243\247\232\235 "..itemname )
end

----------------------------------������ --------------------------------------------------------------
function ItemUse_respectbox (role, Item)

	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	 if Item_CanGet < 1 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224")
		UseItemFailed ( role )
		return
	end
	local i= CheckBagItem( role, 5705 )                                                
	if i <=0 then
		SystemNotice(  role , "\211 \226\224\241 \237\229\242\243 \234\235\254\247\224")
		UseItemFailed ( role )
		return LUA_FALSE

	end
	
	local s = DelBagItem ( role , 5705 , 1 ) 
	local	sc = math.random(1,100)
	local itemname = ""
	if  sc <=10 then	
		GiveItem ( role , 0 , 3087 , 5 , 4 )                    ---------------Ԫ˧֮��   ��û���20%
		itemname = "\198\240\229\225\232\233 \212\238\240\242\243\237\251 (5\248\242) "
	elseif sc <=20 then		
		GiveItem ( role , 0 , 7623 , 2 , 20 )                    ---------------�����֮צ   ��û���20%
		itemname = "100 \208\229\239\243\242\224\246\232\232 (2\248\242) "
	elseif sc <=30 then		
		GiveItem ( role , 0 , 5714 , 1 , 20 )                    ---------------�����֮צ   ��û���20%
		itemname = "\193\238\230\229\241\242\226\229\237\237\251\233 \209\243\237\228\243\234 "
	elseif sc <=40 then		
		GiveItem ( role , 0 , 5706 , 1 , 20 )                    ---------------�����֮צ   ��û���20%
		itemname = "\193\238\230\229\241\242\226\229\237\237\251\233 \202\235\254\247 "
	elseif sc <=50 then
		GiveItem ( role , 0 ,7620 , 1 , 20 )                    ---------------�����֮��   ��û���20%
		itemname = "\240\224\241\239\232\241\234\243 \237\224 \241\224\236\238\246\226\229\242 +20"
	elseif sc <=60 then
		GiveItem ( role , 0 ,7720 , 1 , 4 )                    ---------------��˫����   ��û���15%
		itemname = "\204\229\248\238\234 \211\235\243\247\248\229\237\232\255 \207\235\224\249\224 "
	elseif sc <=70 then
		GiveItem ( role , 0 ,7502 , 2 , 20 )                    ---------------�����֮��   ��û���14%
		itemname = "\194\229\235\232\234\232\233 \209\226\232\242\238\234 \211\228\224\247\232 (2\248\242)"
	elseif sc <=80 then
		GiveItem ( role , 0 ,7528 , 5 , 4 )                    ---------------����Կ��   ��û���5%
		itemname = "\215\224\241\242\252 \207\235\224\249\224 (5\248\242)"
	elseif sc <=90 then
		GiveItem ( role , 0 , 7482 , 5 , 4 )                   ---------------��У֮��   ��û���2%
		itemname = "\209\243\237\228\243\234 \211\235\243\247\248\229\237\232\255 \221\234\232\239\232\240\238\226\234\232 (5\248\242)"
	elseif sc <=100 then
		GiveItem ( role , 0 , 7503 , 1 , 4 )                   ---------------��У֮��   ��û���2%
		itemname = "\204\232\244\232\247\229\241\234\232\233 \209\226\232\242\238\234 \211\228\224\247\232"
	end
	local cha_name = GetChaDefaultName ( role )
	--Notice ( "\200\227\240\238\234 " ..cha_name.." \238\242\234\240\251\235 \241\243\237\228\243\234 \239\240\229\228\229\235\224,\232 \239\238\235\243\247\232\235 "..itemname )
end

----------------------------------��˫���� --------------------------------------------------------------
function ItemUse_peerlessbox (role, Item)

	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	 if Item_CanGet < 1 then
		SystemNotice(role ,"\206\242\234\240\251\235 \209\243\237\228\243\234 \207\240\229\228\229\235\224, \232 \239\238\235\243\247\232\235")
		UseItemFailed ( role )
		return
	end
	local i= CheckBagItem( role, 5706 )                                                
	if i <=0 then
		SystemNotice(  role , "\211 \226\224\241 \237\229\242\243 \234\235\254\247\224")
		UseItemFailed ( role )
		return LUA_FALSE
	end
	
	local s = DelBagItem ( role , 5706 , 1 ) 
	local	sc = math.random(1,100)
	local itemname = ""
	if  sc <=10 then	
		GiveItem ( role , 0 , 7624 , 1 , 4 )                    ---------------85����װ����   ��û���60%
		itemname = "500 \208\229\239\243\242\224\246\232\232 "
	elseif sc <=20 then	 
		GiveItem ( role , 0 , 7503 , 1 , 4 )                   ---------------��֮����   ��û���15%
		itemname = "\204\232\244\232\247\229\241\234\232\233 \209\226\232\242\238\234 \211\228\224\247\232 "
	elseif sc <=30 then	   
		GiveItem ( role , 0 , 7482 , 7 , 4 )                   ---------------��֮����   ��û���15%
		itemname = "\209\243\237\228\243\234 \211\235\243\247\248\229\237\232\255 \221\234\232\239\232\240\238\226\234\232 (7\248\242) "
	elseif sc <=40 then	  
		GiveItem ( role , 0 , 2801 , 1 , 4 )                   ---------------��֮����   ��û���15%
		itemname = "\204\229\248\238\234 \241 \207\229\241\234\238\236 5 \211\240\238\226\229\237\252 "
	elseif sc <=50 then	  
		GiveItem ( role , 0 , 7451 , 1 , 4 )                   ---------------��֮����   ��û���15%
		itemname = "\209\226\232\242\238\234 \207\229\240\229\244\238\240\230\224 "
	elseif sc <=60 then	  
		GiveItem ( role , 0 , 578 , 10 , 4 )                   ---------------��֮����   ��û���15%
		itemname = "\212\240\243\234\242 \208\238\241\242\224 \212\229\232 (10\248\242) "
	elseif sc <=70 then	  
		GiveItem ( role , 0 , 7720 , 1 , 4 )                   ---------------��֮����   ��û���15%
		itemname = "\204\229\248\238\234 \211\235\243\247\248\229\237\232\255 \207\235\224\249\224 "
	elseif sc <=80 then	  
		GiveItem ( role , 0 , 7482 , 10 , 4 )                   ---------------��֮����   ��û���15%
		itemname = "\209\243\237\228\243\234 \211\235\243\247\248\229\237\232\255 \221\234\232\239\232\240\238\226\234\232 (10\248\242) "
	elseif sc <=90 then	  
		GiveItem ( role , 0 , 7628 , 1 , 4 )                   ---------------��֮����   ��û���15%
		itemname = "\204\229\248\238\234 \241 \204\232\244\232\247\229\241\234\232\236 \212\240\243\234\242\238\236 \212\229\233 "
	elseif sc <=100 then
		GiveItem ( role , 0 ,7528 , 10 , 4 )                    ---------------����Կ��   ��û���5%
		itemname = "\215\224\241\242\252 \207\235\224\249\224 (10\248\242)"
	else   
		GiveItem ( role , 0 , 7489 , 1 , 4 )                   ---------------��У֮��   ��û���2%
		itemname = "\202\238\240\238\225\234\243 \241 \192\243\240\238\233"
	end 
	local cha_name = GetChaDefaultName ( role )
	--Notice ( "\200\227\240\238\234 " ..cha_name.." \238\242\234\240\251\235 \193\238\230\229\241\242\226\229\237\237\251\233 \209\243\237\228\243\234,\232 \239\238\235\243\247\232\235 "..itemname )
end

function ItemUse_FLOWER ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
			--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		UseItemFailed ( role )
		return
	end

	local el = 0
	el =IsChaInRegion( role, 2 )
	if el == 1 then
		SystemNotice( role , "\205\229\226\238\231\236\238\230\237\238 \226\251\231\226\224\242\252 \236\238\237\241\242\240\224 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229" )
		--SystemNotice( role , "���������� ������� ������� � ���������� ����" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	local MonsterID = 1037					-- ������� �������
	local Refresh = 7300					
	local life = 7200000					
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaLifeTime( new, life )
end

function ItemUse_QQ ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
			--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		UseItemFailed ( role )
		return
	end

	local el = 0
	el =IsChaInRegion( role, 2 )
	if el == 1 then
		SystemNotice( role , "\205\229\226\238\231\236\238\230\237\238 \226\251\231\226\224\242\252 \236\238\237\241\242\240\224 \226 \193\229\231\238\239\224\241\237\238\233 \199\238\237\229" )
		--SystemNotice( role , "���������� ������� ������� � ���������� ����" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	local MonsterID = 1036					-- ��������� ���
	local Refresh = 60					
	local life = 7200000					
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaLifeTime( new, life )
end

function ItemUse_XTBOX ( role , Item )
	local item_type = BoxXiang_BaoZhaBOX
	local item_type_rad = BoxXiang_BaoZhaBOX_Rad
	local item_type_count = BoxXiang_BaoZhaBOX_Count
	local maxitem = BoxXiang_baozhabao_Mxcount						
	local item_quality = BoxXiang_baozhabao_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
		
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \209\226\224\228\229\225\237\251\229 \209\235\224\228\238\241\242\232")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ��������� ��������")
		UseItemFailed ( role )
		return
	end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							
	for k = 1 , maxitem , 1 do				
		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k
			break		
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 

	GiveItem ( role , 0 , ItemId , ItemCount , item_quality )
	local GoodItem = {}
	GoodItem[0] = 3111
	GoodItem[1] = 3110
	GoodItem[2] = 3112
	GoodItem[3] = 3886
	GoodItem[4] = 3093
	GoodItem[5] = 3090
	GoodItem[6] = 430
	GoodItem[7] = 179
	GoodItem[8] = 3084
	GoodItem[9] = 3085
	GoodItem[10] = 0244
	GoodItem[11] = 0250
	GoodItem[12] = 0253
	GoodItem[13] = 0260
	GoodItem[14] = 0860
	GoodItem[15] = 0861
	GoodItem[16] = 0862
	GoodItem[17] = 3458
	GoodItem[18] = 0247
	GoodItem[19] = 0271
	local Good_C = 0
	for Good_C = 0 , 19 , 1 do
		if ItemId == GoodItem[Good_C] then
			local itemname = GetItemName ( ItemId ) 
			local cha_name = GetChaDefaultName ( role ) 
			local message = cha_name.." \232\241\239\238\235\252\231\243\229\242 \209\226\224\228\229\225\237\251\229 \241\235\224\228\238\241\242\232 \232 \239\238\235\243\247\224\229\242 "..itemname  
			--local message = cha_name.." ���������� ��������� �������� � �������� "..itemname 
			Notice ( message )
		end
	end
end

function ItemUse_HQBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \210\240\229\225\243\229\242\241\255 3 \241\226\238\225\238\228\237\251\245 \255\247\229\233\234\232 \226 \240\254\234\231\224\234\229, \247\242\238\225\251 \238\242\234\240\251\242\252 \207\224\234\229\242 \241\238 \241\226\224\228\229\225\237\251\236\232 \239\238\228\224\240\234\224\236\232")
		--SystemNotice(role ,"������������ ���������� ����� � ���������. ��������� 3 ��������� ������ � �������, ����� ������� ����� �� ���������� ���������")
		UseItemFailed ( role )
		return
	end
	local el = math.random ( 1, 100 )
	if  el>=1 and el<=20 then
	GiveItem ( role , 0 , 1012  , 1 , 4 ) 
	elseif el>=21 and el<=40 then
	GiveItem ( role , 0 , 1016  , 1 , 4 ) 
	elseif el>=41 and el<60 then
	GiveItem ( role , 0 , 0333  , 1 , 4 ) 
	elseif el>=61 and el<=100 then
	GiveItem ( role , 0 , 0273  , 1 , 4 )	
	end
end

function ItemUse_ZSCard2(role, Item )
        local i = CheckBagItem(role,6947) -- rebirth card
        local k = ChaIsBoat(role)
        local Item_CanGet = GetChaFreeBagGridNum ( role )
        local charLv=Lv ( role )
        if Item_CanGet < 1 then
                SystemNotice(role ,"To use a Rebirth Card requires at least 1 empty inventory slot")
                UseItemFailed ( role )
                return
        end
        if charLv<=74  then
                SystemNotice( role , "Your level is too low to use. Must be 75 or above" )
                UseItemsFailed ( role )
                return
        elseif k == 0 then
                if i > 0 then
                        local j = DelBagItem(role,6947,1) -- rebirth card
                        if j == 1 then
                                GiveItem ( role , 0 , 6949 , 1 , 42) -- rebirth stone
                                GoTo( role,  1750 , 909 , "jialebi") -- teleport to heaven
                                return
                        end
                end
        else
                UseItemsFailed ( role )
        end
                
end



function ItemUse_ZSCard3(role, Item )
        local i = CheckBagItem(role,6948) -- rebirth card
        local k = ChaIsBoat(role)
        local Item_CanGet = GetChaFreeBagGridNum ( role )
        local charLv=Lv ( role )
        if Item_CanGet < 1 then
                SystemNotice(role ,"To use a Rebirth Card requires at least 1 empty inventory slot")
                UseItemFailed ( role )
                return
        end
        if charLv<=74  then
                SystemNotice( role , "Your level is too low to use. Must be 75 or above" )
                UseItemsFailed ( role )
                return
        elseif k == 0 then
                if i > 0 then
                        local j = DelBagItem(role,6948,1) -- rebirth card
                        if j == 1 then
                                GiveItem ( role , 0 , 6950 , 1 , 42) -- rebirth stone
                                GoTo( role,  1750 , 909 , "jialebi") -- teleport to heaven
                                return
                        end
                end
        else
                UseItemsFailed ( role )
        end
                
end

function ItemUse_EnchScroll01 ( role , Item ) -- ������ �� ������
	local body = GetChaItem ( role , 1 , 2 )
	local Item_DEF = GetItemAttr( body, ITEMATTR_VAL_DEF)

	if body ~= 0 and body ~= nil then

		if Item_DEF == 0 then
			SystemNotice(role ,"�������� ����� ������ ������ ��� ����! ")
			UseItemFailed ( role )
			return 
		end

		local rad = math.random ( 1, 100 )
	
		if rad >= 1 and rad <= 60 then
			SystemNotice( role ,"������ ��� �������, ��������� +25 ������ ������! ")
				SetItemAttr( body, ITEMATTR_VAL_DEF, Item_DEF + 25)
				RefreshCha ( role )
		elseif rad >= 61 and rad <= 80 then
			SystemNotice(role ,"�������� ��������� �������� �� �������! ")
				return 
		elseif rad >= 81 and rad <= 97 then
			SystemNotice( role ,"��� ������� ��������� ������ ��� ���������, �������������� ������� �� -25 ������! ")
				SetItemAttr( body, ITEMATTR_VAL_DEF, Item_DEF - 25)
				RefreshCha ( role )
		elseif rad >= 98 and rad <= 100 then
			SystemNotice( role ,"��� ������� ��������� ������ ��� ������ ���������, �������������� ������ ������ ������� �� 1! ")
				SetItemAttr( body, ITEMATTR_VAL_DEF, 1)
				RefreshCha ( role )
		end

	else
		SystemNotice(role ,"������� ������, ������� ������� ��������! ")
		UseItemFailed ( role )
		return 
	end
end

function ItemUse_EnchScroll02 ( role , Item ) -- ������ �� ���.��� � ���/���/����/�����/������ � ����� ����
	local sword = GetChaItem ( role , 1 , 6 )
	local Item_MNATK = GetItemAttr( sword, ITEMATTR_VAL_MNATK)

	if sword ~= 0 and sword ~= nil then

		if Item_MNATK == 0 then
			SystemNotice(role ,"�������� ����� ������ ������ � ����� ����. ")
			UseItemFailed ( role )
			return 
		end

		local rad = math.random ( 1, 100 )
	
		if rad >= 1 and rad <= 60 then
			SystemNotice( role ,"���/���/����/�����/������ ��� �������, ��������� +20 ������ ���. �����! ")
				SetItemAttr( sword, ITEMATTR_VAL_MNATK, Item_MNATK + 20)
				RefreshCha ( role )
		elseif rad >= 61 and rad <= 80 then
			SystemNotice(role ,"�������� ��������� �������� �� �������! ")
				return 
		elseif rad >= 81 and rad <= 97 then
			SystemNotice( role ,"��� ������� ��������� ����/����/����/������/������� ��� ���������, �������������� ������� �� -20 ���. ���! ")
				SetItemAttr( sword, ITEMATTR_VAL_MNATK, Item_MNATK - 20)
				RefreshCha ( role )
		elseif rad >= 98 and rad <= 100 then
			SystemNotice( role ,"�������! ��� ������� ���������, ���/���/����/�����/������ ��� ������ ���������, �������������� ����������� ����� � ����/����/����/������/������� ����� �� 1! ")
				SetItemAttr( sword, ITEMATTR_VAL_MNATK, 1)
				RefreshCha ( role )
		end

	else
		SystemNotice(role ,"������� ���, ������� ������� ��������! ")
		UseItemFailed ( role )
		return 
	end
end

function ItemUse_EnchScroll03 ( role , Item ) -- ������ �� ����. ��� � ���/���/����/�����/������ � ����� ����
	local sword = GetChaItem ( role , 1 , 6 )
	local Item_MXATK = GetItemAttr( sword, ITEMATTR_VAL_MXATK)

	if sword ~= 0 and sword ~= nil then

		if Item_MXATK == 0 then
			SystemNotice(role ,"�������� ����� ������ ������ � ����� ����. ")
			UseItemFailed ( role )
			return 
		end

		local rad = math.random ( 1, 100 )
	
		if rad >= 1 and rad <= 60 then
			SystemNotice( role ,"���/���/����/�����/������ ��� �������, ��������� +20 ������ ����. �����! ")
				SetItemAttr( sword, ITEMATTR_VAL_MXATK, Item_MXATK + 20)
				RefreshCha ( role )
		elseif rad >= 61 and rad <= 80 then
			SystemNotice(role ,"�������� ��������� �������� �� �������! ")
				return 
		elseif rad >= 81 and rad <= 97 then
			SystemNotice( role ,"��� ������� ��������� ����/����/����/������/������� ��� ���������, �������������� ������� �� -20 ����. ���! ")
				SetItemAttr( sword, ITEMATTR_VAL_MXATK, Item_MXATK - 20)
				RefreshCha ( role )
		elseif rad >= 98 and rad <= 100 then
			SystemNotice( role ,"�������! ��� ������� ��������� ����/����/����/������/������� ��� ������ ���������, �������������� ������������ ����� � ����/����/����/������/������� ����� �� 1! ")
				SetItemAttr( sword, ITEMATTR_VAL_MXATK, 1)
				RefreshCha ( role )
		end

	else
		SystemNotice(role ,"������� ���, ������� ������� ��������! ")
		UseItemFailed ( role )
		return 
	end
end

function ItemUse_EnchScroll04 ( role , Item ) -- ������ �� ���.��� � ���� � ������ ����
	local sword = GetChaItem ( role , 1 , 9 )
	local Item_MNATK = GetItemAttr( sword, ITEMATTR_VAL_MNATK)

	if sword ~= 0 and sword ~= nil then

		if Item_MNATK == 0 then
			SystemNotice(role ,"�������� ����� ������ ������ � ������ ����. ")
			UseItemFailed ( role )
			return 
		end

		local rad = math.random ( 1, 100 )
	
		if rad >= 1 and rad <= 60 then
			SystemNotice( role ,"��� ��� �������, ��������� +20 ������ ���. �����! ")
				SetItemAttr( sword, ITEMATTR_VAL_MNATK, Item_MNATK + 20)
				RefreshCha ( role )
		elseif rad >= 61 and rad <= 80 then
			SystemNotice(role ,"�������� ��������� �������� �� �������! ")
				return 
		elseif rad >= 81 and rad <= 97 then
			SystemNotice( role ,"��� ������� ���������, ��� ��� ���������, �������������� ������� �� -20 ���. ���! ")
				SetItemAttr( sword, ITEMATTR_VAL_MNATK, Item_MNATK - 20)
				RefreshCha ( role )
		elseif rad >= 98 and rad <= 100 then
			SystemNotice( role ,"�������! ��� ������� ���������, ��� ��� ������ ���������, �������������� ����������� ����� � ���� ����� �� 1! ")
				SetItemAttr( sword, ITEMATTR_VAL_MNATK, 1)
				RefreshCha ( role )
		end

	else
		SystemNotice(role ,"������� ���, ������� ������� ��������! ")
		UseItemFailed ( role )
		return 
	end
end

function ItemUse_EnchScroll05 ( role , Item ) -- ������ �� ����. ��� � ���� � ������ ����
	local sword = GetChaItem ( role , 1 , 9 )
	local Item_MXATK = GetItemAttr( sword, ITEMATTR_VAL_MXATK)

	if sword ~= 0 and sword ~= nil then

		if Item_MXATK == 0 then
			SystemNotice(role ,"�������� ����� ������ ������ � ������ ����. ")
			UseItemFailed ( role )
			return 
		end

		local rad = math.random ( 1, 100 )
	
		if rad >= 1 and rad <= 60 then
			SystemNotice( role ,"��� ��� �������, ��������� +20 ������ ����. �����! ")
				SetItemAttr( sword, ITEMATTR_VAL_MXATK, Item_MXATK + 20)
				RefreshCha ( role )
		elseif rad >= 61 and rad <= 80 then
			SystemNotice(role ,"�������� ��������� �������� �� �������! ")
				return 
		elseif rad >= 81 and rad <= 97 then
			SystemNotice( role ,"��� ������� ���������, ��� ��� ���������, �������������� ������� �� -20 ����. ���! ")
				SetItemAttr( sword, ITEMATTR_VAL_MXATK, Item_MXATK - 20)
				RefreshCha ( role )
		elseif rad >= 98 and rad <= 100 then
			SystemNotice( role ,"�������! ��� ������� ��������� ���� ��� ������ ���������, �������������� ������������ ����� � ���� ����� �� 1! ")
				SetItemAttr( sword, ITEMATTR_VAL_MXATK, 1)
				RefreshCha ( role )
		end

	else
		SystemNotice(role ,"������� ���, ������� ������� ��������! ")
		UseItemFailed ( role )
		return 
	end
end

function ItemUse_EnchScroll06 ( role , Item ) -- ������ �� ���� � �����
	local shoes = GetChaItem ( role , 1 , 4 )
	local Item_FLEE = GetItemAttr( shoes, ITEMATTR_VAL_FLEE)

	if shoes ~= 0 and shoes ~= nil then

		if Item_FLEE == 0 then
			SystemNotice(role ,"�������� ����� ������ ������� �������. ")
			UseItemFailed ( role )
			return 
		end

		local rad = math.random ( 1, 100 )
	
		if rad >= 1 and rad <= 60 then
			SystemNotice( role ,"������� ���� ��������, ��������� +15 ������ ���������! ")
				SetItemAttr( shoes, ITEMATTR_VAL_FLEE, Item_FLEE + 15)
				RefreshCha ( role )
		elseif rad >= 61 and rad <= 80 then
			SystemNotice(role ,"�������� ��������� �������� �� �������! ")
				return 
		elseif rad >= 81 and rad <= 97 then
			SystemNotice( role ,"��� ������� ���������, ������� ���� ����������, �������������� ������� �� -15 ���������! ")
				SetItemAttr( shoes, ITEMATTR_VAL_FLEE, Item_FLEE - 15)
				RefreshCha ( role )
		elseif rad >= 98 and rad <= 100 then
			SystemNotice( role ,"�������! ��� ������� ��������� ������� ��� ������ ���������, �������������� ��������� � ������� ����� �� 1! ")
				SetItemAttr( shoes, ITEMATTR_VAL_FLEE, 1)
				RefreshCha ( role )
		end

	else
		SystemNotice(role ,"������� �������, ������� ������� ��������! ")
		UseItemFailed ( role )
		return 
	end
end

function ItemUse_EnchScroll07 ( role , Item ) -- ������ �� ��� � ������
	local gloves = GetChaItem ( role , 1 , 3 )
	local Item_HIT = GetItemAttr( gloves, ITEMATTR_VAL_HIT)

	if gloves ~= 0 and gloves ~= nil then

		if Item_HIT == 0 then
			SystemNotice(role ,"�������� ����� ������ ������� ��������. ")
			UseItemFailed ( role )
			return 
		end

		local rad = math.random ( 1, 100 )
	
		if rad >= 1 and rad <= 60 then
			SystemNotice( role ,"�������� ���� ��������, ��������� +10 ������ ���������! ")
				SetItemAttr( gloves, ITEMATTR_VAL_HIT, Item_HIT + 10)
				RefreshCha ( role )
		elseif rad >= 61 and rad <= 80 then
			SystemNotice(role ,"�������� ��������� �������� �� �������! ")
				return 
		elseif rad >= 81 and rad <= 97 then
			SystemNotice( role ,"��� ������� ���������, �������� ���� ����������, �������������� ������� �� -10 ���������! ")
				SetItemAttr( gloves, ITEMATTR_VAL_HIT, Item_HIT - 10)
				RefreshCha ( role )
		elseif rad >= 98 and rad <= 100 then
			SystemNotice( role ,"�������! ��� ������� ��������� �������� ��� ������ ���������, �������������� ��������� � �������� ����� �� 1! ")
				SetItemAttr( gloves, ITEMATTR_VAL_HIT, 1)
				RefreshCha ( role )
		end

	else
		SystemNotice(role ,"������� ��������, ������� ������� ��������! ")
		UseItemFailed ( role )
		return 
	end
end

function ItemUse_EnchScroll08 ( role , Item ) -- ������ �� ��� � �����
	local hat = GetChaItem ( role , 1 , 0 )
	local Item_DEF = GetItemAttr( hat, ITEMATTR_VAL_DEF)

	if hat ~= 0 and hat ~= nil then

		if Item_DEF == 0 then
			SystemNotice(role ,"�������� ����� ������ ������� �����. ")
			UseItemFailed ( role )
			return 
		end

		local rad = math.random ( 1, 100 )
	
		if rad >= 1 and rad <= 60 then
			SystemNotice( role ,"����� ���� ��������, ��������� +10 ������ ������! ")
				SetItemAttr( hat, ITEMATTR_VAL_DEF, Item_DEF + 10)
				RefreshCha ( role )
		elseif rad >= 61 and rad <= 80 then
			SystemNotice(role ,"�������� ��������� �������� �� �������! ")
				return 
		elseif rad >= 81 and rad <= 97 then
			SystemNotice( role ,"��� ������� ���������, ����� ���� ����������, �������������� ������� �� -10 ������! ")
				SetItemAttr( hat, ITEMATTR_VAL_DEF, Item_DEF - 10)
				RefreshCha ( role )
		elseif rad >= 98 and rad <= 100 then
			SystemNotice( role ,"�������! ��� ������� ��������� ����� ���� ������ ����������, �������������� ������ � ����� ����� �� 1! ")
				SetItemAttr( hat, ITEMATTR_VAL_DEF, 1)
				RefreshCha ( role )
		end

	else
		SystemNotice(role ,"������� �����, ������� ������� ��������! ")
		UseItemFailed ( role )
		return 
	end
end

function ItemUse_newyear (role, Item)

	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \210\240\229\225\243\229\242\241\255 3 \241\226\238\225\238\228\237\251\245 \255\247\229\233\234\232 \226 \240\254\234\231\224\234\229, \247\242\238\225\251 \238\242\234\240\251\242\252 \207\224\234\229\242 \241\238 \241\226\224\228\229\225\237\251\236\232 \239\238\228\224\240\234\224\236\232")
		--SystemNotice(role ,"������������ ���������� ����� � ���������. ��������� 4 ��������� ������ � �������, ����� ������� �������.")
		UseItemFailed ( role )
		return
	end
	local el = math.random ( 1, 100 )
	if  el>=1 and el<=10 then
	GiveItem ( role , 0 , 7355  , 1 , 4 ) 
	elseif el>=10 and el<=20 then
	GiveItem ( role , 0 , 2608  , 1 , 4 ) 
	elseif el>=20 and el<30 then
	GiveItem ( role , 0 , 3457  , 50 , 4 ) 
	elseif el>=30 and el<=40 then
	GiveItem ( role , 0 , 3457  , 35 , 4 )	
	elseif el>=40 and el<=50 then
	GiveItem ( role , 0 , 3457  , 30 , 4 )
	elseif el>=50 and el<=60 then
	GiveItem ( role , 0 , 3457  , 25 , 4 )
	elseif el>=60 and el<=70 then
	GiveItem ( role , 0 , 3457  , 20 , 4 )
	elseif el>=70 and el<=80 then
	GiveItem ( role , 0 , 3457  , 15 , 4 )
	elseif el>=80 and el<=90 then
	GiveItem ( role , 0 , 3457  , 10 , 4 )
	elseif el>=90 and el<=100 then
	GiveItem ( role , 0 , 3457  , 5 , 4 )
	end
end

function ItemUse_klu (role, Item)

	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \210\240\229\225\243\229\242\241\255 3 \241\226\238\225\238\228\237\251\245 \255\247\229\233\234\232 \226 \240\254\234\231\224\234\229, \247\242\238\225\251 \238\242\234\240\251\242\252 \207\224\234\229\242 \241\238 \241\226\224\228\229\225\237\251\236\232 \239\238\228\224\240\234\224\236\232")
		--SystemNotice(role ,"������������ ���������� ����� � ���������. ��������� 4 ��������� ������ � �������, ����� ������� ������.")
		UseItemFailed ( role )
		return
	end
	local el = math.random ( 1, 100 )
	if  el>=1 and el<=10 then
	GiveItem ( role , 0 , 3457  , 50 , 4 ) 
	elseif el>=10 and el<=20 then
	GiveItem ( role , 0 , 3457  , 40 , 4 ) 
	elseif el>=20 and el<30 then
	GiveItem ( role , 0 , 3457  , 35 , 4 ) 
	elseif el>=30 and el<=40 then
	GiveItem ( role , 0 , 3457  , 30 , 4 )	
	elseif el>=40 and el<=50 then
	GiveItem ( role , 0 , 3457  , 26 , 4 )
	elseif el>=50 and el<=60 then
	GiveItem ( role , 0 , 3457  , 23 , 4 )
	elseif el>=60 and el<=70 then
	GiveItem ( role , 0 , 3457  , 20 , 4 )
	elseif el>=70 and el<=80 then
	GiveItem ( role , 0 , 3457  , 15 , 4 )
	elseif el>=80 and el<=90 then
	GiveItem ( role , 0 , 3457  , 10 , 4 )
	elseif el>=90 and el<=100 then
	GiveItem ( role , 0 , 3457  , 5 , 4 )
	end
end

function ItemUse_kluc (role, Item)

	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \210\240\229\225\243\229\242\241\255 3 \241\226\238\225\238\228\237\251\245 \255\247\229\233\234\232 \226 \240\254\234\231\224\234\229, \247\242\238\225\251 \238\242\234\240\251\242\252 \207\224\234\229\242 \241\238 \241\226\224\228\229\225\237\251\236\232 \239\238\228\224\240\234\224\236\232")
		--SystemNotice(role ,"������������ ���������� ����� � ���������. ��������� 4 ��������� ������ � �������, ����� ������� ������.")
		UseItemFailed ( role )
		return
	end
	local el = math.random ( 1, 100 )
	if  el>=1 and el<=10 then
	GiveItem ( role , 0 , 7355  , 3 , 4 ) 
	elseif el>=10 and el<=20 then
	GiveItem ( role , 0 , 7355  , 2 , 4 ) 
	elseif el>=20 and el<30 then
	GiveItem ( role , 0 , 7355  , 2 , 4 ) 
	elseif el>=30 and el<=40 then
	GiveItem ( role , 0 , 7355  , 1 , 4 )	
	elseif el>=40 and el<=50 then
	GiveItem ( role , 0 , 7355  , 1 , 4 )
	elseif el>=50 and el<=60 then
	GiveItem ( role , 0 , 7355  , 1 , 4 )
	elseif el>=60 and el<=70 then
	GiveItem ( role , 0 , 7355  , 1 , 4 )
	elseif el>=70 and el<=80 then
	GiveItem ( role , 0 , 7355  , 1 , 4 )
	elseif el>=80 and el<=90 then
	GiveItem ( role , 0 , 7355  , 1 , 4 )
	elseif el>=90 and el<=100 then
	GiveItem ( role , 0 , 7355  , 1 , 4 )
	end
end

function ItemUse_kluch (role, Item)

	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \210\240\229\225\243\229\242\241\255 3 \241\226\238\225\238\228\237\251\245 \255\247\229\233\234\232 \226 \240\254\234\231\224\234\229, \247\242\238\225\251 \238\242\234\240\251\242\252 \207\224\234\229\242 \241\238 \241\226\224\228\229\225\237\251\236\232 \239\238\228\224\240\234\224\236\232")
		--SystemNotice(role ,"������������ ���������� ����� � ���������. ��������� 4 ��������� ������ � �������, ����� ������� ������.")
		UseItemFailed ( role )
		return
	end
	local el = math.random ( 1, 100 )
	if  el>=1 and el<=10 then
	GiveItem ( role , 0 , 2608  , 2 , 4 ) 
	elseif el>=10 and el<=20 then
	GiveItem ( role , 0 , 2608  , 1 , 4 ) 
	elseif el>=20 and el<30 then
	GiveItem ( role , 0 , 2608  , 1 , 4 ) 
	elseif el>=30 and el<=40 then
	GiveItem ( role , 0 , 2608  , 1 , 4 )	
	elseif el>=40 and el<=50 then
	GiveItem ( role , 0 , 2608  , 1 , 4 )
	elseif el>=50 and el<=60 then
	GiveItem ( role , 0 , 2608  , 1 , 4 )
	elseif el>=60 and el<=70 then
	GiveItem ( role , 0 , 2608  , 1 , 4 )
	elseif el>=70 and el<=80 then
	GiveItem ( role , 0 , 2608  , 1 , 4 )
	elseif el>=80 and el<=90 then
	GiveItem ( role , 0 , 2608  , 1 , 4 )
	elseif el>=90 and el<=100 then
	GiveItem ( role , 0 , 2608  , 1 , 4 )
	end
end

function ItemUse_kluc1 (role, Item)

	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \210\240\229\225\243\229\242\241\255 3 \241\226\238\225\238\228\237\251\245 \255\247\229\233\234\232 \226 \240\254\234\231\224\234\229, \247\242\238\225\251 \238\242\234\240\251\242\252 \207\224\234\229\242 \241\238 \241\226\224\228\229\225\237\251\236\232 \239\238\228\224\240\234\224\236\232")
		--SystemNotice(role ,"������������ ���������� ����� � ���������. ��������� 4 ��������� ������ � �������, ����� ������� ������.")
		UseItemFailed ( role )
		return
	end
	local el = math.random ( 1, 100 )
	if  el>=1 and el<=10 then
	GiveItem ( role , 0 , 7424  , 3 , 4 ) 
	elseif el>=10 and el<=20 then
	GiveItem ( role , 0 , 7424  , 2 , 4 ) 
	elseif el>=20 and el<30 then
	GiveItem ( role , 0 , 7424  , 1 , 4 ) 
	elseif el>=30 and el<=40 then
	GiveItem ( role , 0 , 7424  , 1 , 4 )	
	elseif el>=40 and el<=50 then
	GiveItem ( role , 0 , 7424  , 1 , 4 )
	elseif el>=50 and el<=60 then
	GiveItem ( role , 0 , 7424  , 1 , 4 )
	elseif el>=60 and el<=70 then
	GiveItem ( role , 0 , 7424  , 1 , 4 )
	elseif el>=70 and el<=80 then
	GiveItem ( role , 0 , 7424  , 1 , 4 )
	elseif el>=80 and el<=90 then
	GiveItem ( role , 0 , 7424  , 1 , 4 )
	elseif el>=90 and el<=100 then
	GiveItem ( role , 0 , 7424  , 1 , 4 )
	end
end
-- ����� �� ��� +2 (�� 150 �� 500)
function ItemUse_Great_Agiup ( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 200 or elf_lvl >= 500 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 200 ������,� ��� �� ���� ���� 500 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224" )
UseItemFailed ( role )
else
Lvup_Agi_2 ( role , Item_Num , Item_Traget )
end
end
end
-- ����� �� ��� +2 (�� 150 �� 500)
function ItemUse_Great_Strup ( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 200 or elf_lvl >= 500 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 200 ������,� ��� �� ���� ���� 500 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224" )
UseItemFailed ( role )
else
Lvup_Str_2 ( role , Item_Num , Item_Traget )
end
end
end
-- ����� �� ��� +2 (�� 150 �� 500)
function ItemUse_Great_Conup ( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 200 or elf_lvl >= 500 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 200 ������,� ��� �� ���� ���� 500 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224" )
UseItemFailed ( role )
else
Lvup_Con_2 ( role , Item_Num , Item_Traget )
end
end
end
-- ����� �� ��� +2 (�� 150 �� 500)
function ItemUse_Great_Dexup ( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 200 or elf_lvl >= 500 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 200 ������,� ��� �� ���� ���� 500 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224" )
UseItemFailed ( role )
else
Lvup_Dex_2 ( role , Item_Num , Item_Traget )
end
end
end
-- ����� �� ��� +2 (�� 150 �� 500)
function ItemUse_Great_Staup ( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 200 or elf_lvl >= 500 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 200 ������,� ��� �� ���� ���� 500 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224" )
UseItemFailed ( role )
else
Lvup_Sta_2 ( role , Item_Num , Item_Traget )
end
end
end

function ItemUse_erdengjitim ( role , Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		--SystemNotice( role ,"������������ ��������� ������ � ���������")
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0455  , 1 , 4  ) 
	GiveItem ( role , 0 , 0456  , 1 , 4  ) 
end

function ItemUse_chestcvit ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 5 then
		SystemNotice(role ,"������������ ��������� ������ � ���������! ")
		UseItemFailed ( role )
		return
	end
		GiveItem ( role , 0 , math.random ( 7477, 7481 )  , 1 , 5 ) 
end

function ItemUse_erdengjttim ( role , Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
local rad = math.random ( 1, 3 )
	local itemname = ""
	if rad == 1 then
	GiveItem ( role , 0 , 7750  , 1 , 4 ) 
	itemname = "\207\224\243\247\232\233 \196\238\241\239\229\245"
	elseif rad == 2 then
	GiveItem ( role , 0 , 7751  , 1 , 4 )  
	itemname = "\207\224\243\247\252\232 \207\229\240\247\224\242\234\232"
	elseif rad == 3 then
	GiveItem ( role , 0 , 7752  , 1 , 4 )  
	itemname = "\207\224\243\247\252\232 \193\238\242\232\237\234\232"
	end	
	local cha_name = GetChaDefaultName ( role )
	--Notice ( "\200\227\240\238\234 " ..cha_name.." \238\242\234\240\251\235 \241\243\237\228\243\234 \241 \239\224\243\247\252\232\236 \248\236\238\242\238\236,\232 \239\238\235\243\247\232\235 "..itemname )
end
--������ �� �������
function Jz_Script_zef(role, Item )
	local i = CheckBagItem(role,8605)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "������������ - ������������ �������. ����������, ���������� ��������� �� � ��")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,8605,1)
			if j == 1 then
				MoveCity(role,"Zephyr Isle")
				return
			end
		end
	else
		UseItemFailed ( role )
		return
	end
		
end
function Jz_Script_otv(role, Item )
	local i = CheckBagItem(role,8606)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "������������ - ������������ �������. ����������, ���������� ��������� �� � ��")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,8606,1)
			if j == 1 then
				MoveCity(role,"Outlaw Isle")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end
function Jz_Script_led(role, Item )
	local i = CheckBagItem(role,8607)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "������������ - ������������ �������. ����������, ���������� ��������� �� � ��")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,8607,1)
			if j == 1 then
				MoveCity(role,"Glacier Isle")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end
function Jz_Script_yda(role, Item )
	local i = CheckBagItem(role,8608)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "������������ - ������������ �������. ����������, ���������� ��������� �� � ��")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,8608,1)
			if j == 1 then
				MoveCity(role,"Isle of Fortune")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end
function Jz_Script_kan(role, Item )
	local i = CheckBagItem(role,7446)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "������������ - ������������ �������. ����������, ���������� ��������� �� � ��")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,7446,1)
			if j == 1 then
				MoveCity(role,"Canary Isle")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end
function Jz_Script_kyp(role, Item )

	local i = CheckBagItem(role,7447)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "������������ - ������������ �������. ����������, ���������� ��������� �� � ��")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,7447,1)
			if j == 1 then
				MoveCity(role,"Cupid Isle")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end
function Jz_Script_stu(role, Item )
	local i = CheckBagItem(role,7448)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "������������ - ������������ �������. ����������, ���������� ��������� �� � ��")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,7448,1)
			if j == 1 then
				MoveCity(role,"Isle of Chill")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

function ItemUse_erdengtttim ( role , Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
local rad = math.random ( 1, 9 )
	local itemname = ""
	if rad == 1 then
	GiveItem ( role , 0 , 7749  , 1 , 7 ) 
	itemname = "\207\224\243\247\232\233 \234\235\232\237\238\234"
	elseif rad == 2 then
	GiveItem ( role , 0 , 7749  , 1 , 7 )  
	itemname = "\207\224\243\247\232\233 \236\238\235\238\242"
	elseif rad == 3 then
	GiveItem ( role , 0 , 7749  , 1 , 7 )  
	itemname = "\207\224\243\247\232\233 \239\238\241\238\245 \193\202"
	elseif rad == 4 then
	GiveItem ( role , 0 , 7749  , 1 , 7 ) 
	itemname = "\207\224\243\247\232\233 \239\238\241\238\245 \209\204"
	elseif rad == 5 then
	GiveItem ( role , 0 , 7749  , 1 , 7 )  
	itemname = "\207\224\243\247\232\233 \239\232\241\242\238\235\229\242"
	elseif rad == 6 then
	GiveItem ( role , 0 , 7749  , 1 , 7 ) 
	itemname = "\207\224\243\247\232\233 \231\243\225"
	elseif rad == 7 then
	GiveItem ( role , 0 , 7749  , 1 , 7 ) 
	itemname = "\207\224\243\247\232\233 \235\243\234"
	elseif rad == 8 then
	GiveItem ( role , 0 , 7749  , 1 , 7 ) 
	itemname = "\207\224\243\247\252\229 \230\224\235\238"
	elseif rad == 9 then
	GiveItem ( role , 0 , 7749  , 1 , 7 ) 
	itemname = "\207\224\243\247\232\233 \249\232\242"
	end	
	local cha_name = GetChaDefaultName ( role )
	--Notice ( "\200\227\240\238\234 " ..cha_name.." \238\242\234\240\251\235 \241\243\237\228\243\234 \241 \239\224\243\247\232\236 \238\240\243\230\232\229\236, \232 \239\238\235\243\247\232\235 "..itemname )
end

-- ������ ��������� ������ --
function ItemUse_Exp1(role) 
local lv_role = GetChaAttr ( role , ATTR_LV )
	local lv_next = lv_role + 1
	SetChaAttrI( role , ATTR_LV , lv_next )

end
-- ������ ������������� --
function ItemUse_Stat1(role)
local ap_role = GetChaAttr ( role , ATTR_AP )
local ap_next = ap_role + 1
SetChaAttrI( role , ATTR_AP , ap_next )
end

-- ������ ����� --
function ItemUse_Skill1(role)
local tp_role = GetChaAttr ( role , ATTR_TP )
local tp_next = tp_role + 1
SetChaAttrI( role , ATTR_TP , tp_next )
end

function ItemUse_timgems ( role , Item ) 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
local rad = math.random ( 1, 5 )
	if rad == 1 then
	GiveItem ( role , 0 , 860  , 1 , 5 ) 
	elseif rad == 2 then
	GiveItem ( role , 0 , 861  , 1 , 5 )  
	elseif rad == 3 then
	GiveItem ( role , 0 , 862  , 1 , 5 )  
	elseif rad == 4 then
	GiveItem ( role , 0 , 863  , 1 , 5 ) 
	elseif rad == 5 then
	GiveItem ( role , 0 , 1012  , 1 , 5 ) 
	end	
end

function ItemUse_timjeton ( role , Item ) 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
local rad = math.random ( 1, 9 )
	if rad == 1 then
	GiveItem ( role , 0 , 7484  , 1 , 9 ) 
	elseif rad == 2 then
	GiveItem ( role , 0 , 7482  , 1 , 9 )  
	elseif rad == 3 then
	GiveItem ( role , 0 , 7467  , 1 , 9 )  
	elseif rad == 4 then
	GiveItem ( role , 0 , 7455  , 1 , 9 ) 
	elseif rad == 5 then
	GiveItem ( role , 0 , 7491  , 1 , 9 ) 
	elseif rad == 6 then
	GiveItem ( role , 0 , 7620  , 1 , 9 ) 
	elseif rad == 7 then
	GiveItem ( role , 0 , 7625  , 1 , 9 ) 
	elseif rad == 8 then
	GiveItem ( role , 0 , 7622  , 1 , 9 ) 
	elseif rad == 9 then
	GiveItem ( role , 0 , 7614  , 1 , 9 ) 

	end	
end

function ItemUse_timref ( role , Item ) 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 885  , 1 , 4 )  
	end	


--���������� ����
function ItemUse_Bank( role, Item )
   OpenBank( role, role )
end

function ItemUse_kelstim ( role , Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		--SystemNotice( role ,"������������ ��������� ������ � ���������")
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 3457  , 10 , 4  ) 
	 
end

function ItemUse_kelsstimdr ( role , Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		--SystemNotice( role ,"������������ ��������� ������ � ���������")
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 3457  , 50 , 4  ) 
	 
end


function ItemUse_kelsstim ( role , Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		--SystemNotice( role ,"������������ ��������� ������ � ���������")
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 3457  , 100 , 4  ) 
	 
end

function ItemUse_kelsustim ( role , Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		--SystemNotice( role ,"������������ ��������� ������ � ���������")
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 3457  , 1000 , 4  ) 
	 
end


-- ������ ������ �������
-- 50% ���� ������ ������� (+10 ������)
-- 30% ����, ��� ������ �� ���������
-- 15% ���� ����������� ������� (-10 ������)
-- 5% ���� �������� ����������� ������� (������ ���������� ������ 1 �������)
function ItemUse_EnchScroll01 ( role , Item )
local body = GetChaItem ( role , 1 , 2 )
local Item_DEF = GetItemAttr( body, ITEMATTR_VAL_DEF)
 
if body == 0 then
UseItemFailed ( role )
else
SystemNotice(role ,"������� ������, ������� ������� ��������! ")
end
 
if Item_DEF == 0 then
UseItemFailed ( role )
else
SystemNotice(role ,"�������� ����� ������ ������ ��� ����! ")
end
 
local rad = math.random ( 1, 100 )
 
if rad <= 50 and rad >= 1 then
Item_DEF = Item_DEF + 1
SystemNotice( role ,"������ ��� �������, ��������� 10 ������ ������! ")
SetItemAttr( body, ITEMATTR_VAL_DEF, Item_DEF)
RefreshCha ( role )
elseif rad <= 80 and rad >= 51 then
SystemNotice(role ,"�������� ��������� �������� �� �������! ")
elseif rad <= 95 and rad >= 81 then
Item_DEF = Item_DEF - 10
SystemNotice( role ,"��� ������� ��������� ������ ��� ���������, �������������� �������! ")
SetItemAttr( body, ITEMATTR_VAL_DEF, Item_DEF)
RefreshCha ( role )
elseif rad <= 100 and rad >= 96 then
SystemNotice( role ,"��� ������� ��������� ������ ��� ������ ��������� ���������, �������������� ����������� �������! ")
SetItemAttr( body, ITEMATTR_VAL_DEF, 1)
RefreshCha ( role )
end
end

function Item_Use_Pendowo(role,Item)

    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
    if Cha_Boat ~=  nil then
        SystemNotice( role , "Cannot use while sailing!" )
        UseItemFailed ( role )
        return
    end

        local Equipment        = GetChaItem(role, 2, 0)
        local EquipmentName    = GetItemName(GetItemID(Equipment))
        local EquipmentType    = GetItemType2(GetItemID(Equipment))
		local Item_ID        = GetItemID(Item)

        if(Equipment == nil)then
        SystemNotice( role ,"����� �������� ������ ����� ���� � 1 �����! ")
        UseItemFailed ( role )
        return
        end


    if Item_ID == 7477 then --Attack (Puntodewo)
            if(EquipmentType == 1 or EquipmentType == 2 or EquipmentType == 3 or EquipmentType == 4 or EquipmentType == 7 or EquipmentType == 9)then

                local ItemAttrI    = GetItemAttr(Equipment, ITEMATTR_VAL_MNATK)
                local ItemAttrII = GetItemAttr(Equipment, ITEMATTR_VAL_MXATK)
            local Bonus    = 50
                local FinalAttrI = ItemAttrI + Bonus
                local FinalAttrII= ItemAttrII + Bonus
            local Limit    = 32000    --Limit value you want (Max 32767)
			 local effect = 587              -- ID ������� �� sceneffectinfo.txt
			 PlayEffect (role, effect )      -- ���������� ����������� �
            if (ItemAttrI >= Limit or ItemAttrII >= Limit) then
                    SystemNotice(role,"��������� ����� ���������!")
                UseItemFailed ( role )
                return
            end

            if (FinalAttrI >= Limit or FinalAttrII >= Limit) then
                    SetItemAttr(Equipment, ITEMATTR_VAL_MNATK, Limit)
                    SetItemAttr(Equipment, ITEMATTR_VAL_MXATK, Limit)
            else
                    SetItemAttr(Equipment, ITEMATTR_VAL_MNATK, FinalAttrI)
                    SetItemAttr(Equipment, ITEMATTR_VAL_MXATK, FinalAttrII)
            end

                SystemNotice(role,"�������� ���������� +"..Bonus.."	����� ��� ������ ������ ")
                RefreshCha(role)
			else
                SystemNotice(role,"������ ������ ����� ��������!")
            UseItemFailed ( role )
            return
			end
			end
			end

function Item_Use_Pendowoq(role,Item)

    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
    if Cha_Boat ~=  nil then
        SystemNotice( role , "Cannot use while sailing!" )
        UseItemFailed ( role )
        return
    end

        local Equipment        = GetChaItem(role, 2, 0)
        local EquipmentName    = GetItemName(GetItemID(Equipment))
        local EquipmentType    = GetItemType2(GetItemID(Equipment))
		local Item_ID        = GetItemID(Item)

        if(Equipment == nil)then
        SystemNotice( role ,"����� �������� ������ ����� ���� � 1 �����! ")
        UseItemFailed ( role )
        return
        end

	if Item_ID == 7478 then --Defense (Werkudoro)
            if(EquipmentType == 20 or EquipmentType or EquipmentType == 22 or EquipmentType == 23 or EquipmentType == 24 or EquipmentType == 27)then
                
                local ItemAttr    = GetItemAttr(Equipment, ITEMATTR_VAL_DEF)
            local Bonus    = 5
                local FinalAttr = ItemAttr + Bonus
            local Limit    = 32000
			local effect = 587              -- ID ������� �� sceneffectinfo.txt
			PlayEffect (role, effect )      -- ���������� ����������� �
            if (ItemAttr >= Limit) then
			    SystemNotice(role,"��������� ����� ���������!")

                UseItemFailed ( role )
                return
            end

            if (FinalAttr >= Limit) then
                    SetItemAttr(Equipment, ITEMATTR_VAL_DEF, Limit)
            else
                    SetItemAttr(Equipment, ITEMATTR_VAL_DEF, FinalAttr)
            end
			  SystemNotice(role,"�������� ���������� +"..Bonus.." ������ ��� ����� ���������� ")
              RefreshCha(role)
			else
            SystemNotice(role,"������ ������,�������,�������� � ����� ����� ��������!")
            UseItemFailed ( role )
            return
            end
			end
			end
			
function Item_Use_Pendowow(role,Item)

    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
    if Cha_Boat ~=  nil then
        SystemNotice( role , "Cannot use while sailing!" )
        UseItemFailed ( role )
        return
    end

        local Equipment        = GetChaItem(role, 2, 0)
        local EquipmentName    = GetItemName(GetItemID(Equipment))
        local EquipmentType    = GetItemType2(GetItemID(Equipment))
		local Item_ID        = GetItemID(Item)

        if(Equipment == nil)then
        SystemNotice( role ,"����� �������� ������ ����� ���� � 1 �����! ")
        UseItemFailed ( role )
        return
        end

    if Item_ID == 7479 then --Phy Resist (Arjuno)
            if(EquipmentType == 22 or EquipmentType == 11 or EquipmentType == 27)then

                local ItemAttr    = GetItemAttr(Equipment, ITEMATTR_VAL_PDEF)
            local Bonus    = 1
                local FinalAttr = ItemAttr + Bonus
            local Limit    = 1000
			 local effect = 587              -- ID ������� �� sceneffectinfo.txt
			PlayEffect (role, effect )      -- ���������� ����������� �
            if (ItemAttr >= Limit) then
                    SystemNotice(role,"��������� ����� ���������!")
                UseItemFailed ( role )
                return
            end

            if (FinalAttr >= Limit) then
                    SetItemAttr(Equipment, ITEMATTR_VAL_PDEF, Limit)
            else
                    SetItemAttr(Equipment, ITEMATTR_VAL_PDEF, FinalAttr)
            end
             SystemNotice(role,"�������� ���������� +"..Bonus.." ������������� ��� ����� ���������� ")
             RefreshCha(role)
			 else
			SystemNotice(role,"������ ������ � ���� ����� ��������!")
            UseItemFailed ( role )
            return
            end
			end
			end

function Item_Use_Pendowoe(role,Item)

    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
    if Cha_Boat ~=  nil then
        SystemNotice( role , "Cannot use while sailing!" )
        UseItemFailed ( role )
        return
    end

        local Equipment        = GetChaItem(role, 2, 0)
        local EquipmentName    = GetItemName(GetItemID(Equipment))
        local EquipmentType    = GetItemType2(GetItemID(Equipment))
		local Item_ID        = GetItemID(Item)

        if(Equipment == nil)then
        SystemNotice( role ,"����� �������� ������ ����� ���� � 1 �����! ")
        UseItemFailed ( role )
        return
        end			
			
    if Item_ID == 7480 then --Dodge (Nakulo)
            if(EquipmentType == 24)then
            local ItemAttr = GetItemAttr(Equipment, ITEMATTR_VAL_FLEE)
            local Bonus = 5
            local FinalAttr = ItemAttr + Bonus
            local Limit    = 32000
			 local effect = 587              -- ID ������� �� sceneffectinfo.txt
			PlayEffect (role, effect )      -- ���������� ����������� �
            if (ItemAttr >= Limit) then
                    SystemNotice(role,"��������� ����� ���������!")
                UseItemFailed ( role )
                return
            end

            if (FinalAttr >= Limit) then
                    SetItemAttr(Equipment, ITEMATTR_VAL_FLEE, Limit)
            else
                    SetItemAttr(Equipment, ITEMATTR_VAL_FLEE, FinalAttr)
			end
			 SystemNotice(role,"�������� ���������� +"..Bonus.." ��������� ��� ����� ������� ")
             RefreshCha(role)
			 else
            SystemNotice(role," ������ ������� ����� ��������! ")
            UseItemFailed ( role )
            return
            end
			end
			end

function Item_Use_Pendowor(role,Item)

    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
    if Cha_Boat ~=  nil then
        SystemNotice( role , "Cannot use while sailing!" )
        UseItemFailed ( role )
        return
    end

        local Equipment        = GetChaItem(role, 2, 0)
        local EquipmentName    = GetItemName(GetItemID(Equipment))
        local EquipmentType    = GetItemType2(GetItemID(Equipment))
		local Item_ID        = GetItemID(Item)

        if(Equipment == nil)then
        SystemNotice( role ,"����� �������� ������ ����� ���� � 1 �����! ")
        UseItemFailed ( role )
        return
        end
    if Item_ID == 7481 then --Hit rate (Sadewo)
            if(EquipmentType == 23 )then

                local ItemAttr    = GetItemAttr(Equipment, ITEMATTR_VAL_HIT)
            local Bonus    = 5
                local FinalAttr = ItemAttr + Bonus
            local Limit    = 32000
			local effect = 587              -- ID ������� �� sceneffectinfo.txt
			PlayEffect (role, effect )      -- ���������� ����������� �
            if (ItemAttr >= Limit) then
                    SystemNotice(role," ��������� ����� ���������! ")
                UseItemFailed ( role )
                return
            end

            if (FinalAttr >= Limit) then
                    SetItemAttr(Equipment, ITEMATTR_VAL_HIT, Limit)
            else
                    SetItemAttr(Equipment, ITEMATTR_VAL_HIT, FinalAttr)
            end

                SystemNotice(role,"�������� ���������� +"..Bonus.." ��������� ��� ����� �������� ")
                RefreshCha(role)
            else

                SystemNotice(role,"������ �������� ����� ��������!")
            UseItemFailed ( role )
            return
            end
    end
end




function ItemUse_anjela ( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \255\233\246\238 \244\229\232")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���� ���")
		--SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end

	GiveItem ( role , 0 , 450  , 1 , 4 ) 
end

function ItemUse_anjelajunio ( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \255\233\246\238 \244\229\232")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���� ���")
		--SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end

	GiveItem ( role , 0 , 451  , 1 , 4 ) 
end

function ItemUse_avgusty ( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \255\233\246\238 \244\229\232")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���� ���")
		--SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end

	GiveItem ( role , 0 , 235  , 1 , 4 ) 
end
function ItemUse_dragonfayr ( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \236\229\241\242\224 \226 \232\237\226\229\237\242\224\240\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \255\233\246\238 \244\229\232")
		--SystemNotice(role ,"������������ ����� � ���������. ���������� ������������ ���� ���")
		--SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end

	GiveItem ( role , 0 , 459  , 1 , 4 ) 
end

function ItemUse_chestaura ( role , Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
local rad = math.random ( 1, 62 )
	if rad == 1 then
	GiveItem ( role , 0 , 7312  , 1 , 90 ) 
	elseif rad == 2 then
	GiveItem ( role , 0 , 7313  , 1 , 90 )  
	elseif rad == 3 then
	GiveItem ( role , 0 , 7314  , 1 , 90 )  
	elseif rad == 4 then
	GiveItem ( role , 0 , 7315  , 1 , 90 ) 
	elseif rad == 5 then
	GiveItem ( role , 0 , 7316  , 1 , 90 ) 
	elseif rad == 6 then
	GiveItem ( role , 0 , 7317  , 1 , 90 ) 
	elseif rad == 7 then
	GiveItem ( role , 0 , 7318  , 1 , 90 )    
	elseif rad == 8 then
	GiveItem ( role , 0 , 7326  , 1 , 90 ) 
	elseif rad == 9 then
	GiveItem ( role , 0 , 7327  , 1 , 90 ) 
	elseif rad == 10 then
	GiveItem ( role , 0 , 7328  , 1 , 90 ) 
	elseif rad == 11 then
	GiveItem ( role , 0 , 7330  , 1 , 90 )  
	elseif rad == 12 then
	GiveItem ( role , 0 , 7331  , 1 , 90 )  
	elseif rad == 13 then
	GiveItem ( role , 0 , 7332  , 1 , 90 ) 
	elseif rad == 14 then
	GiveItem ( role , 0 , 7333  , 1 , 90 ) 
	elseif rad == 15 then
	GiveItem ( role , 0 , 7334  , 1 , 90 ) 
	elseif rad == 16 then
	GiveItem ( role , 0 , 7356  , 1 , 90 )    
	elseif rad == 17 then
	GiveItem ( role , 0 , 7359  , 1 , 90 ) 
	elseif rad == 18 then
	GiveItem ( role , 0 , 7361  , 1 , 90 ) 
	elseif rad == 19 then
	GiveItem ( role , 0 , 7362  , 1 , 90 ) 
	elseif rad == 20 then
	GiveItem ( role , 0 , 7363  , 1 , 90 )  
	elseif rad == 21 then
	GiveItem ( role , 0 , 7364  , 1 , 90 )  
	elseif rad == 22 then
	GiveItem ( role , 0 , 7365  , 1 , 90 ) 
	elseif rad == 23 then
	GiveItem ( role , 0 , 7366  , 1 , 90 ) 
	elseif rad == 24 then
	GiveItem ( role , 0 , 7367  , 1 , 90 ) 
	elseif rad == 25 then
	GiveItem ( role , 0 , 7368  , 1 , 90 )    
	elseif rad == 26 then
	GiveItem ( role , 0 , 7369  , 1 , 90 ) 
	elseif rad == 27 then
	GiveItem ( role , 0 , 7370  , 1 , 90 ) 
	elseif rad == 28 then
	GiveItem ( role , 0 , 7380  , 1 , 90 ) 
	elseif rad == 29 then
	GiveItem ( role , 0 , 7381  , 1 , 90 )  
	elseif rad == 30 then
	GiveItem ( role , 0 , 7383  , 1 , 90 ) 
	elseif rad == 31 then
	GiveItem ( role , 0 , 7384  , 1 , 90 ) 
	elseif rad == 32 then
	GiveItem ( role , 0 , 7385  , 1 , 90 ) 
	elseif rad == 33 then
	GiveItem ( role , 0 , 7386  , 1 , 90 )    
	elseif rad == 34 then
	GiveItem ( role , 0 , 7387  , 1 , 90 ) 
	elseif rad == 35 then
	GiveItem ( role , 0 , 7388  , 1 , 90 ) 
	elseif rad == 36 then
	GiveItem ( role , 0 , 7389  , 1 , 90 ) 
	elseif rad == 37 then
	GiveItem ( role , 0 , 7392  , 1 , 90 )  
	elseif rad == 38 then
	GiveItem ( role , 0 , 7393  , 1 , 90 )  
	elseif rad == 39 then
	GiveItem ( role , 0 , 7394  , 1 , 90 ) 
	elseif rad == 40 then
	GiveItem ( role , 0 , 7395  , 1 , 90 ) 
	elseif rad == 41 then
	GiveItem ( role , 0 , 7396  , 1 , 90 ) 
	elseif rad == 42 then
	GiveItem ( role , 0 , 7397  , 1 , 90 )    
	elseif rad == 43 then
	GiveItem ( role , 0 , 7398  , 1 , 90 ) 
	elseif rad == 44 then
	GiveItem ( role , 0 , 7399  , 1 , 90 ) 
	elseif rad == 45 then
	GiveItem ( role , 0 , 7400  , 1 , 90 ) 
	elseif rad == 46 then
	GiveItem ( role , 0 , 7401  , 1 , 90 )  
	elseif rad == 47 then
	GiveItem ( role , 0 , 7402  , 1 , 90 )  
	elseif rad == 48 then
	GiveItem ( role , 0 , 7403  , 1 , 90 ) 
	elseif rad == 49 then
	GiveItem ( role , 0 , 7405  , 1 , 90 ) 
	elseif rad == 50 then
	GiveItem ( role , 0 , 7406  , 1 , 90 ) 
	elseif rad == 51 then
	GiveItem ( role , 0 , 7408  , 1 , 90 )    
	elseif rad == 52 then
	GiveItem ( role , 0 , 7410  , 1 , 90 ) 
	elseif rad == 53 then
	GiveItem ( role , 0 , 7411  , 1 , 90 ) 
	elseif rad == 54 then
	GiveItem ( role , 0 , 7412  , 1 , 90 )  
	elseif rad == 55 then
	GiveItem ( role , 0 , 7413  , 1 , 90 )  
	elseif rad == 56 then
	GiveItem ( role , 0 , 7365  , 1 , 90 ) 
	elseif rad == 57 then
	GiveItem ( role , 0 , 7366  , 1 , 90 ) 
	elseif rad == 58 then
	GiveItem ( role , 0 , 7367  , 1 , 90 ) 
	elseif rad == 59 then
	GiveItem ( role , 0 , 7368  , 1 , 90 )    
	elseif rad == 60 then
	GiveItem ( role , 0 , 7369  , 1 , 90 ) 
	elseif rad == 61 then
	GiveItem ( role , 0 , 7370  , 1 , 90 ) 
	elseif rad == 62 then
	GiveItem ( role , 0 , 7379  , 1 , 90 ) 
	end	
	local cha_name = GetChaDefaultName ( role ) 
	--local message = cha_name.." ��������� ������� � ������,� �������� ���� �� 93 ��� "
	Notice ( message )
end


function ItemUse_chestnovpr( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 3598  , 1 , 4 ) 
	GiveItem ( role , 0 , 3599  , 1 , 4 )  
	GiveItem ( role , 0 , 3600  , 1 , 4 )  
end	

function ItemUse_chestnovppp( role, Item )
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
        local cha_type = GetChaTypeID ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 4 then
		SystemNotice(role ,"��� ����� 4 ��������� ����� � 2 ���������!")
		UseItemFailed ( role )
		return
	end
	if lv < 150 then
		SystemNotice(role ,"��� ����� 150 ������� � ������ ���������!")
		UseItemFailed ( role )	
	elseif job == 8 then  
		GiveItem ( role , 0 , 4275  , 1 , 95 ) 
		GiveItem ( role , 0 , 4282  , 1 , 95 ) 
		GiveItem ( role , 0 , 4281  , 1 , 95 )
		GiveItem ( role , 0 , 4281  , 1 , 95 )
	elseif job == 9 then  
		GiveItem ( role , 0 , 4274  , 1 , 95 ) 
		GiveItem ( role , 0 , 4274  , 1 , 95 ) 
		GiveItem ( role , 0 , 4282  , 1 , 95 ) 		
	elseif job == 12 then   
		GiveItem ( role , 0 , 4277  , 1 , 95 ) 
		GiveItem ( role , 0 , 4283  , 1 , 95 ) 
	elseif job == 16 then  
		GiveItem ( role , 0 , 4276  , 1 , 95 ) 
		
	elseif job == 13 then    
		GiveItem ( role , 0 , 4279  , 1 , 95 ) 

	elseif job == 14 then    
		GiveItem ( role , 0 , 4280  , 1 , 95 ) 
	else 
		SystemNotice(role ,"�� ��� �� �������� ������ ���������!")
		UseItemFailed ( role )	
	end
end

function ItemUse_chesvelikix ( role , Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
local rad = math.random ( 1, 5 )
	if rad == 1 then
	GiveItem ( role , 0 , 7108  , 1 , 5 ) 
	elseif rad == 2 then
	GiveItem ( role , 0 , 7109  , 1 , 5 )  
	elseif rad == 3 then
	GiveItem ( role , 0 , 7110  , 1 , 5 )  
	elseif rad == 4 then
	GiveItem ( role , 0 , 7111  , 1 , 5 ) 
	elseif rad == 5 then
	GiveItem ( role , 0 , 7112  , 1 , 5 ) 
	end	
end

function ItemUse_Timg( role , Item ) 							
 	local Money_add = 50000
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Have>=1999950000 then
		SystemNotice (role, "\211 \194\224\241 \241\235\232\248\234\238\236 \236\237\238\227\238 \231\238\235\238\242\224. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \239\240\229\228\236\229\242")
		--SystemNotice (role, "� ��� ������� ����� ������. ���������� ������������ �������)
		--SystemNotice (role, "Your account is saturated. Unable to use item")
		UseItemFailed ( role )
		return	
	end
	AddMoney ( role , 0 , Money_add )
end 

function ItemUse_Timgo( role , Item ) 							
 	local Money_add = 100000
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Have>=1999900000 then
		SystemNotice (role, "\211 \194\224\241 \241\235\232\248\234\238\236 \236\237\238\227\238 \231\238\235\238\242\224. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \239\240\229\228\236\229\242")
		--SystemNotice (role, "� ��� ������� ����� ������. ���������� ������������ �������)
		--SystemNotice (role, "Your account is saturated. Unable to use item")
		UseItemFailed ( role )
		return	
	end
	AddMoney ( role , 0 , Money_add )
end 

function ItemUse_Timgolld( role , Item ) 							
 	local Money_add = 500000
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Have>=1999500000 then
		SystemNotice (role, "\211 \194\224\241 \241\235\232\248\234\238\236 \236\237\238\227\238 \231\238\235\238\242\224. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \239\240\229\228\236\229\242")
		--SystemNotice (role, "� ��� ������� ����� ������. ���������� ������������ �������)
		--SystemNotice (role, "Your account is saturated. Unable to use item")
		UseItemFailed ( role )
		return	
	end
	AddMoney ( role , 0 , Money_add )
end 

function ItemUse_Timgollds( role , Item ) 							
 	local Money_add = 5000000
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Have>=1994000000 then
		SystemNotice (role, "\211 \194\224\241 \241\235\232\248\234\238\236 \236\237\238\227\238 \231\238\235\238\242\224. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \239\240\229\228\236\229\242")
		--SystemNotice (role, "� ��� ������� ����� ������. ���������� ������������ �������)
		--SystemNotice (role, "Your account is saturated. Unable to use item")
		UseItemFailed ( role )
		return	
	end
	AddMoney ( role , 0 , Money_add )
end 

function ItemUse_Timgolldo( role , Item ) 							
 	local Money_add = 50000000
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Have>=1940000000 then
		SystemNotice (role, "\211 \194\224\241 \241\235\232\248\234\238\236 \236\237\238\227\238 \231\238\235\238\242\224. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \239\240\229\228\236\229\242")
		--SystemNotice (role, "� ��� ������� ����� ������. ���������� ������������ �������)
		--SystemNotice (role, "Your account is saturated. Unable to use item")
		UseItemFailed ( role )
		return	
	end
	AddMoney ( role , 0 , Money_add )
end 

function ItemUse_Timgolldr( role , Item ) 							
 	local Money_add = 500000000
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Have>=1490000000 then
		SystemNotice (role, "\211 \194\224\241 \241\235\232\248\234\238\236 \236\237\238\227\238 \231\238\235\238\242\224. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \239\240\229\228\236\229\242")
		--SystemNotice (role, "� ��� ������� ����� ������. ���������� ������������ �������)
		--SystemNotice (role, "Your account is saturated. Unable to use item")
		UseItemFailed ( role )
		return	
	end
	AddMoney ( role , 0 , Money_add )
end 

function ItemUse_Timgolldg( role , Item ) 							
 	local Money_add = 1000000000
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Have>=999999999 then
		SystemNotice (role, "\211 \194\224\241 \241\235\232\248\234\238\236 \236\237\238\227\238 \231\238\235\238\242\224. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \239\240\229\228\236\229\242")
		--SystemNotice (role, "� ��� ������� ����� ������. ���������� ������������ �������)
		--SystemNotice (role, "Your account is saturated. Unable to use item")
		UseItemFailed ( role )
		return	
	end
	AddMoney ( role , 0 , Money_add )
end 

function ItemUse_timruna ( role , Item ) 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
local rad = math.random ( 1, 4 )
	if rad == 1 then
	GiveItem ( role , 0 , 6231  , 1 , 4 ) 
	elseif rad == 2 then
	GiveItem ( role , 0 , 6232  , 1 , 4 )  
	elseif rad == 3 then
	GiveItem ( role , 0 , 6233  , 1 , 4 )  
	elseif rad == 4 then
	GiveItem ( role , 0 , 6234  , 1 , 4 )  

end	
end

function ItemUse_mewsfruit (role, Item)

	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	 if Item_CanGet < 1 then
		SystemNotice(role ,"\205\229\242 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224")
		UseItemFailed ( role )
		return
	end
	local	sc = math.random(1,100)
	local itemname = ""
	if  sc <=20 then	
		GiveItem ( role , 0 , 7430 , 1 , 4 )                    ---------------Ԫ˧֮��   ��û���20%
		itemname = "\244\240\243\234\242 \235\238\226\234\238\241\242\232"
	elseif sc <=40 then		
		GiveItem ( role , 0 , 7431 , 1 , 20 )                    ---------------�����֮צ   ��û���20%
		itemname = "\244\240\243\234\242 \241\232\235\251"
	elseif sc <=60 then
		GiveItem ( role , 0 ,7419 , 1 , 20 )                    ---------------�����֮��   ��û���20%
		itemname = "\244\240\243\234\242 \242\229\235\238\241\235\238\230\229\237\232\255"
	elseif sc <=80 then
		GiveItem ( role , 0 ,7433 , 1 , 4 )                    ---------------��˫����   ��û���15%
		itemname = "\244\240\243\234\242 \242\238\247\237\238\241\242\232"
	elseif sc <=100 then
		GiveItem ( role , 0 ,7434 , 1 , 20 )                    ---------------�����֮��   ��û���14%
		itemname = "\244\240\243\234\242 \228\243\245\224"
	end
	local cha_name = GetChaDefaultName ( role )
	Notice ( "\200\227\240\238\234 " ..cha_name.." \238\242\234\240\251\235 \236\229\248\238\234 \241 \226\229\235\232\234\232\236 \244\240\243\234\242\238\236 \244\229\232, \232 \239\238\235\243\247\232\235 "..itemname )
end

function ItemUse_weaponabadd( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224")
		--SystemNotice(role ,"����� ������� ������ ������ �� ������� ���� ��������� 1 ��������� ���� � ����� ���������")
		--SystemNotice(role ,"To open the Carcass of Death requires at least 1 empty inventory slot")
		UseItemFailed ( role )
		return
	end
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
	local star_rad=math.random ( 1, 1 )
	if lv < 150 then
		SystemNotice(role ,"\194\224\248 \243\240\238\226\229\237\252 \237\232\230\229 \247\229\236 150!")
		--SystemNotice(role ,"��� ������� ���� ��� 150. ���������� ������������ �������!")
		--SystemNotice(role ,"Currently lower than Lv 40. Unable to use item!")
		UseItemFailed ( role )	
	elseif job == 9 then 
			GiveItem ( role , 0 , 3619  , 1 , 4 ) 
			GiveItem ( role , 0 , 3619  , 1 , 4 ) 
			GiveItem ( role , 0 , 3627  , 1 , 4 ) 
		
	elseif job == 8 then   
			GiveItem ( role , 0 , 3629  , 1 , 4 ) 
			GiveItem ( role , 0 , 3629  , 1 , 4 ) 
			GiveItem ( role , 0 , 3620  , 1 , 4 ) 
			GiveItem ( role , 0 , 3627  , 1 , 4 ) 
		
	elseif job == 12 then 
			GiveItem ( role , 0 , 3622  , 1 , 4 ) 
			GiveItem ( role , 0 , 3623  , 1 , 4 )  
		
	elseif job == 16 then 
			GiveItem ( role , 0 , 3626  , 1 , 4 ) 
		
	elseif job == 13 then    
			GiveItem ( role , 0 , 3625  , 1 , 4 ) 
		
	elseif job == 14 then    
			GiveItem ( role , 0 , 3624  , 1 , 4 ) 
		
	else 
		SystemNotice(role ,"\207\240\229\228\236\229\242 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237 \242\238\235\252\234\238 \239\238\241\235\229 \226\251\225\238\240\224 \226\242\238\240\238\227\238 \238\241\237\238\226\237\238\227\238 \234\235\224\241\241\224!")
		--SystemNotice(role ,"������� ����� ���� ����������� ������ ����� ������ ������� ��������� ������!")
		--SystemNotice(role ,"Class mismatch. Item can only be used after second class advancement!")
		UseItemFailed ( role )	
	end
end

function ItemUse_isparmor ( role , Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 3632  , 1 , 4 ) 
	GiveItem ( role , 0 , 3633  , 1 , 4 )  
	GiveItem ( role , 0 , 3634  , 1 , 4 )  
end	

function ItemUse_timbukva ( role , Item ) 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		UseItemFailed ( role )
		return
	end
local rad = math.random ( 1, 26 )
	if rad == 1 then
	GiveItem ( role , 0 , 3850  , 1 , 4 ) 
	elseif rad == 2 then
	GiveItem ( role , 0 , 3851  , 1 , 4 )  
	elseif rad == 3 then
	GiveItem ( role , 0 , 3852  , 1 , 4 )  
	elseif rad == 4 then
	GiveItem ( role , 0 , 3853  , 1 , 4 )  
	elseif rad == 5 then
	GiveItem ( role , 0 , 3854  , 1 , 4 ) 
	elseif rad == 6 then
	GiveItem ( role , 0 , 3855  , 1 , 4 ) 
	elseif rad == 7 then
	GiveItem ( role , 0 , 3856  , 1 , 4 ) 
	elseif rad == 8 then
	GiveItem ( role , 0 , 3857  , 1 , 4 ) 
	elseif rad == 9 then
	GiveItem ( role , 0 , 3858  , 1 , 4 ) 
	elseif rad == 10 then
	GiveItem ( role , 0 , 3859  , 1 , 4 ) 
	elseif rad == 11 then
	GiveItem ( role , 0 , 3860  , 1 , 4 ) 
	elseif rad == 12 then
	GiveItem ( role , 0 , 3861  , 1 , 4 ) 
	elseif rad == 13 then
	GiveItem ( role , 0 , 3862  , 1 , 4 ) 
	elseif rad == 14 then
	GiveItem ( role , 0 , 3863  , 1 , 4 ) 
	elseif rad == 15 then
	GiveItem ( role , 0 , 3864  , 1 , 4 ) 
	elseif rad == 16 then
	GiveItem ( role , 0 , 3865  , 1 , 4 ) 
	elseif rad == 17 then
	GiveItem ( role , 0 , 3866  , 1 , 4 )
	elseif rad == 18 then
	GiveItem ( role , 0 , 3867  , 1 , 4 )
	elseif rad == 19 then
	GiveItem ( role , 0 , 3868  , 1 , 4 )
	elseif rad == 20 then
	GiveItem ( role , 0 , 3869  , 1 , 4 )
	elseif rad == 21 then
	GiveItem ( role , 0 , 3870  , 1 , 4 )
	elseif rad == 22 then
	GiveItem ( role , 0 , 3871  , 1 , 4 )
	elseif rad == 23 then
	GiveItem ( role , 0 , 3872  , 1 , 4 )
	elseif rad == 24 then
	GiveItem ( role , 0 , 3873  , 1 , 4 )
	elseif rad == 25 then
	GiveItem ( role , 0 , 3874  , 1 , 4 )
	elseif rad == 26 then
	GiveItem ( role , 0 , 3875  , 1 , 4 )

end	
end

--���� �5
function ItemUse_dropx5( role , Item )
		local statelv = 7
    local ChaStateLv = GetChaStateLv ( role , STATE_SBBLGZ )
    if ChaStateLv >= statelv then
        SystemNotice ( role , "����� ����������� ��� ����������� ��������� ����� ��� ������������" )
        UseItemFailed ( role )
        return
    end
    local statetime = 600
    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
    if Cha_Boat ==  nil then
        AddState( role , role , STATE_SBBLGZ , statelv , statetime )
    else
        AddState( Cha_Boat , Cha_Boat , STATE_SBBLGZ , statelv , statetime )
    end
    SystemNotice ( role ,"���� ��������� ����� �������� � 5 ��� " )
	local effect = 812              -- ID ������� �� sceneffectinfo.txt
    PlayEffect (role, effect )      -- ���������� ����������� �
end

--���� �10
function ItemUse_dropx65( role , Item )
		local statelv = 10
    local ChaStateLv = GetChaStateLv ( role , STATE_SBBLGZ )
    if ChaStateLv >= statelv then
        SystemNotice ( role , "����� ����������� ��� ����������� ��������� ����� ��� ������������" )
        UseItemFailed ( role )
        return
    end
    local statetime = 600
    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
    if Cha_Boat ==  nil then
        AddState( role , role , STATE_SBBLGZ , statelv , statetime )
    else
        AddState( Cha_Boat , Cha_Boat , STATE_SBBLGZ , statelv , statetime )
    end
    SystemNotice ( role ,"���� ��������� ����� �������� � 10 ��� " )
	local effect = 812              -- ID ������� �� sceneffectinfo.txt
    PlayEffect (role, effect )      -- ���������� ����������� �
end

-- ����� �� ��� +2 (�� 500 �� 800)
function ItemUse_Agiupnext ( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 500 or elf_lvl >= 800 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 500 ������,� ��� �� ���� ���� 800 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224 " )
UseItemFailed ( role )
else
Lvup_Agi_3 ( role , Item_Num , Item_Traget )
end
end
end
-- ����� �� ��� +2 (�� 500 �� 800)
function ItemUse_Strupnext ( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 500 or elf_lvl >= 800 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 500 ������,� ��� �� ���� ���� 800 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224" )
UseItemFailed ( role )
else
Lvup_Str_3 ( role , Item_Num , Item_Traget )
end
end
end
-- ����� �� ��� +2 (�� 500 �� 800)
function ItemUse_Conupnext ( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 500 or elf_lvl >= 800 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 500 ������,� ��� �� ���� ���� 800 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224" )
UseItemFailed ( role )
else
Lvup_Con_3 ( role , Item_Num , Item_Traget )
end
end
end
-- ����� �� ��� +2 (�� 500 �� 800)
function ItemUse_Dexupnext ( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 500 or elf_lvl >= 800 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 500 ������,� ��� �� ���� ���� 800 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224" )
UseItemFailed ( role )
else
Lvup_Dex_3 ( role , Item_Num , Item_Traget )
end
end
end
-- ����� �� ��� +2 (�� 500 �� 800)
function ItemUse_Staupnext ( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 500 or elf_lvl >= 800 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 500 ������,� ��� �� ���� ���� 800 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224" )
UseItemFailed ( role )
else
Lvup_Sta_3 ( role , Item_Num , Item_Traget )
end
end
end




-- ����� �� ��� +2 (�� 800 �� 1000)
function ItemUse_Agiupnexty ( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 800 or elf_lvl >= 1000 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 800 ������,� ��� �� ���� ���� 1000 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224 " )
UseItemFailed ( role )
else
Lvup_Agi_4 ( role , Item_Num , Item_Traget )
end
end
end
-- ����� �� ��� +2 (�� 800 �� 1000)
function ItemUse_Strtimad ( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 800 or elf_lvl >= 1000 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 800 ������,� ��� �� ���� ���� 1000 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224" )
UseItemFailed ( role )
else
Lvup_Str_4 ( role , Item_Num , Item_Traget )
end
end
end
-- ����� �� ��� +2 (�� 800 �� 1000)
function ItemUse_Conupnexty ( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 800 or elf_lvl >= 1000 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 800 ������,� ��� �� ���� ���� 1000 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224" )
UseItemFailed ( role )
else
Lvup_Con_4 ( role , Item_Num , Item_Traget )
end
end
end
-- ����� �� ��� +2 (�� 800 �� 1000)
function ItemUse_Dexupnexty ( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 800 or elf_lvl >= 1000 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 800 ������,� ��� �� ���� ���� 1000 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224" )
UseItemFailed ( role )
else
Lvup_Dex_4 ( role , Item_Num , Item_Traget )
end
end
end
-- ����� �� ��� +2 (�� 800 �� 1000)
function ItemUse_Statimad ( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 800 or elf_lvl >= 1000 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 800 ������,� ��� �� ���� ���� 1000 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224" )
UseItemFailed ( role )
else
Lvup_Sta_4 ( role , Item_Num , Item_Traget )
end
end
end





-- ����� �� ��� +2 (�� 1000 �� 1200)
function ItemUse_Agitimad( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 1000 or elf_lvl >= 1200 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 1000 ������,� ��� �� ���� ���� 1200 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224 " )
UseItemFailed ( role )
else
Lvup_Agi_5 ( role , Item_Num , Item_Traget )
end
end
end
-- ����� �� ��� +2 (�� 1000 �� 1200)
function ItemUse_Strupnexty ( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 1000 or elf_lvl >= 1200 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 1000 ������,� ��� �� ���� ���� 1200 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224" )
UseItemFailed ( role )
else
Lvup_Str_5 ( role , Item_Num , Item_Traget )
end
end
end
-- ����� �� ��� +2 (�� 1000 �� 1200)
function ItemUse_Contimad ( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 1000 or elf_lvl >= 1200 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 1000 ������,� ��� �� ���� ���� 1200 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224" )
UseItemFailed ( role )
else
Lvup_Con_5 ( role , Item_Num , Item_Traget )
end
end
end
-- ����� �� ��� +2 ((�� 1000 �� 1200)
function ItemUse_akktimad ( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 1000 or elf_lvl >= 1200 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 1000 ������,� ��� �� ���� ���� 1200 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224" )
UseItemFailed ( role )
else
Lvup_Dex_5 ( role , Item_Num , Item_Traget )
end
end
end
-- ����� �� ��� +2 (�� 1000 �� 1200)
function ItemUse_Staupnexty ( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 1000 or elf_lvl >= 1200 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 1000 ������,� ��� �� ���� ���� 1200 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224" )
UseItemFailed ( role )
else
Lvup_Sta_5 ( role , Item_Num , Item_Traget )
end
end
end



-- ����� �� ��� +2 (�� 1200 �� 1400)
function ItemUse_Agitckorb( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 1200 or elf_lvl >= 1400 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 1200 ������,� ��� �� ���� ���� 1400 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224 " )
UseItemFailed ( role )
else
Lvup_Agi_6 ( role , Item_Num , Item_Traget )
end
end
end
-- ����� �� ��� +2 (�� 1200 �� 1400)
function ItemUse_Struskorb ( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 1200 or elf_lvl >= 1400 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 1200 ������,� ��� �� ���� ���� 1400 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224" )
UseItemFailed ( role )
else
Lvup_Str_6 ( role , Item_Num , Item_Traget )
end
end
end
-- ����� �� ��� +2 (�� 1200 �� 1400)
function ItemUse_Conskorb ( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 1200 or elf_lvl >= 1400 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 1200 ������,� ��� �� ���� ���� 1400 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224" )
UseItemFailed ( role )
else
Lvup_Con_6 ( role , Item_Num , Item_Traget )
end
end
end
-- ����� �� ��� +2 ((�� 1200 �� 1400)
function ItemUse_akkskorb ( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 1200 or elf_lvl >= 1400 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 1200 ������,� ��� �� ���� ���� 1400 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224" )
UseItemFailed ( role )
else
Lvup_Dex_6 ( role , Item_Num , Item_Traget )
end
end
end
-- ����� �� ��� +2 (�� 1200 �� 1400)
function ItemUse_Staskorb ( role , Item , Item_Traget )
local Cha_Boat = 0
Cha_Boat = GetCtrlBoat ( role )
if Cha_Boat ~= nil then
SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
UseItemFailed ( role )
return
end
local Item_type = GetItemType ( Item )
local Item_Traget_Type = GetItemType ( Item_Traget )
local Item_Num = GetItemID ( Item )
local Check_Exp = 0
local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY)
local str = GetItemAttr(Item_Traget,ITEMATTR_VAL_STR)
local con = GetItemAttr(Item_Traget,ITEMATTR_VAL_CON)
local dex = GetItemAttr(Item_Traget,ITEMATTR_VAL_DEX)
local agi = GetItemAttr(Item_Traget,ITEMATTR_VAL_AGI)
local sta = GetItemAttr(Item_Traget,ITEMATTR_VAL_STA)
local elf_lvl = str + con + agi + dex + sta
if elf_lvl < 1200 or elf_lvl >= 1400 and elf_lvl <= 99999999999 then
SystemNotice(role , "���� ����� ������ ������������, ���� ���� ��� ������ 1200 ������,� ��� �� ���� ���� 1400 ������ " )
UseItemFailed ( role )
return
end
if Item_type == 58 and Item_Traget_Type == 59 then
Check_Exp = CheckElf_EXP ( role , Item_Traget )
if Check_Exp == 0 then
SystemNotice(role , "\208\238\241\242 \244\229\232 \237\229 \228\238\241\242\232\227 \236\224\234\241\232\236\243\236\224" )
UseItemFailed ( role )
else
Lvup_Sta_6 ( role , Item_Num , Item_Traget )
end
end
end




function ItemUse_weaponstraj( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224")
		--SystemNotice(role ,"����� ������� ������ ������ �� ������� ���� ��������� 1 ��������� ���� � ����� ���������")
		--SystemNotice(role ,"To open the Carcass of Death requires at least 1 empty inventory slot")
		UseItemFailed ( role )
		return
	end
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
	local star_rad=math.random ( 1, 1 )
	if lv < 200 then
		SystemNotice(role ,"\194\224\248 \243\240\238\226\229\237\252 \237\232\230\229 \247\229\236 200!")
		--SystemNotice(role ,"��� ������� ���� ��� 150. ���������� ������������ �������!")
		--SystemNotice(role ,"Currently lower than Lv 40. Unable to use item!")
		UseItemFailed ( role )	
	elseif job == 9 then 
			GiveItem ( role , 0 , 3635  , 1 , 4 ) 
			GiveItem ( role , 0 , 3635  , 1 , 4 ) 
			GiveItem ( role , 0 , 3642  , 1 , 4 ) 
		
	elseif job == 8 then   
			GiveItem ( role , 0 , 3644  , 1 , 4 ) 
			GiveItem ( role , 0 , 3636  , 1 , 4 ) 
			GiveItem ( role , 0 , 3644  , 1 , 4 ) 
			GiveItem ( role , 0 , 3642  , 1 , 4 ) 
		
	elseif job == 12 then 
			GiveItem ( role , 0 , 3637  , 1 , 4 ) 
			GiveItem ( role , 0 , 3638  , 1 , 4 )  
		
	elseif job == 16 then 
			GiveItem ( role , 0 , 3641  , 1 , 4 ) 
		
	elseif job == 13 then    
			GiveItem ( role , 0 , 3640  , 1 , 4 ) 
		
	elseif job == 14 then    
			GiveItem ( role , 0 , 3639  , 1 , 4 ) 
		
	else 
		SystemNotice(role ,"\207\240\229\228\236\229\242 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237 \242\238\235\252\234\238 \239\238\241\235\229 \226\251\225\238\240\224 \226\242\238\240\238\227\238 \238\241\237\238\226\237\238\227\238 \234\235\224\241\241\224!")
		--SystemNotice(role ,"������� ����� ���� ����������� ������ ����� ������ ������� ��������� ������!")
		--SystemNotice(role ,"Class mismatch. Item can only be used after second class advancement!")
		UseItemFailed ( role )	
	end
end

function ItemUse_timgemss ( role , Item ) 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
local rad = math.random ( 1, 5 )
	if rad == 1 then
	GiveItem ( role , 0 , 5845  , 1 , 5 ) 
	elseif rad == 2 then
	GiveItem ( role , 0 , 5846  , 1 , 5 )  
	elseif rad == 3 then
	GiveItem ( role , 0 , 5847  , 1 , 5 )  
	elseif rad == 4 then
	GiveItem ( role , 0 , 5848  , 1 , 5 ) 
	elseif rad == 5 then
	GiveItem ( role , 0 , 5849  , 1 , 5 ) 
	end	
end


function ItemUse_timkamstraja ( role , Item ) 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
local rad = math.random ( 1, 3 )
	if rad == 1 then
	GiveItem ( role , 0 , 506  , 1 , 3 ) 
	elseif rad == 2 then
	GiveItem ( role , 0 , 508  , 1 , 3 )    
	elseif rad == 3 then
	GiveItem ( role , 0 , 510  , 1 , 3 )  

end	
end

function ItemUse_talons (role, Item)

	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	 if Item_CanGet < 1 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224 ")
		UseItemFailed ( role )
		return
	end
	
	local	sc = math.random(1,100)
	if  sc <=33 then	
		GiveItem ( role , 0 , 2326 , 1 , 4 )                    ---------------��������   ��û���50%
	elseif sc <=66 then		
		GiveItem ( role , 0 , 2326 , 2 , 4 )                    ---------------��˲ر�ͼ   ��û���40%
	elseif sc <=100 then
		GiveItem ( role , 0 ,2326 , 3 , 4 )                    ---------------����Կ��   ��û���5%
	end
	end
	
	function ItemUse_ledset( role, Item )
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
        local cha_type = GetChaTypeID ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 4 then
		SystemNotice(role ,"��� ����� 4 ��������� ����� � 2 ���������!")
		UseItemFailed ( role )
		return
	end
	if lv < 100 then
		SystemNotice(role ,"��� ����� 100 ��� � ������ ���������!")
		UseItemFailed ( role )	
	elseif job == 8 then  
		GiveItem ( role , 0 , 3665  , 1 , 95 )
		GiveItem ( role , 0 , 3594  , 1 , 95 ) 
		GiveItem ( role , 0 , 3595  , 1 , 95 ) 
		GiveItem ( role , 0 , 3596  , 1 , 95 ) 
	elseif job == 9 then  
		GiveItem ( role , 0 , 3665  , 1 , 95 )
		GiveItem ( role , 0 , 3591  , 1 , 95 ) 
		GiveItem ( role , 0 , 3592  , 1 , 95 ) 
		GiveItem ( role , 0 , 3593  , 1 , 95 ) 

	elseif job == 12 then   
		GiveItem ( role , 0 , 3665  , 1 , 95 )
		GiveItem ( role , 0 , 3588  , 1 , 95 ) 
		GiveItem ( role , 0 , 3589  , 1 , 95 ) 
		GiveItem ( role , 0 , 3590  , 1 , 95 ) 
		  
	elseif job == 16 then  
		GiveItem ( role , 0 , 3665  , 1 , 95 )
		GiveItem ( role , 0 , 3598  , 1 , 95 ) 
		GiveItem ( role , 0 , 3599  , 1 , 95 ) 
		GiveItem ( role , 0 , 3600  , 1 , 95 ) 
		
	elseif job == 13 then    
		GiveItem ( role , 0 , 3665  , 1 , 95 )
		GiveItem ( role , 0 , 3602  , 1 , 95 ) 
		GiveItem ( role , 0 , 3603  , 1 , 95 ) 
		GiveItem ( role , 0 , 3604  , 1 , 95 ) 

	elseif job == 14 then    
		GiveItem ( role , 0 , 3665  , 1 , 95 )
		GiveItem ( role , 0 , 3606  , 1 , 95 ) 
		GiveItem ( role , 0 , 3607  , 1 , 95 ) 
		GiveItem ( role , 0 , 3608  , 1 , 95 ) 
	else 
		SystemNotice(role ,"����� ������ ���������!")
		UseItemFailed ( role )	
	end
end

function ItemUse_aramischest (role, Item)

	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	 if Item_CanGet < 1 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224 ")
		UseItemFailed ( role )
		return
	end
	local i= CheckBagItem( role, 7611 )                                                
	if i <=0 then
		SystemNotice(  role , "\211 \226\224\241 \237\229\242\243 \234\235\254\247\224 \192\240\224\236\232\241\224 ")
		UseItemFailed ( role )
		return LUA_FALSE
	end
	
	local s = DelBagItem ( role , 7611 , 1 ) 
	local	sc = math.random(1,100)
	local itemname = ""
	if  sc <=20 then	
		GiveItem ( role , 0 , 5711 , 5 , 4 )                    ---------------��������   ��û���50%
		itemname = "\209\243\237\228\243\234 \199\229\235\184\237\238\227\238 \196\240\224\234\238\237\224 (5\248\242)"
	elseif sc <=40 then		
		GiveItem ( role , 0 , 7734 , 1 , 4 )                    ---------------��˲ر�ͼ   ��û���40%
		itemname = "\202\243\239\254\240\224 \228\238\241\242\238\232\237\241\242\226\238\236 5.000.000 \231\238\235\238\242\224"
	elseif sc <=60 then
		GiveItem ( role , 0 ,5703 , 5 , 4 )                    ---------------����Կ��   ��û���5%
		itemname = "\202\235\254\247 \199\229\235\184\237\238\227\238 \196\240\224\234\238\237\224 (5\248\242)"
	elseif sc <=80 then
		GiveItem ( role , 0 ,578 , 3 , 4 )                    ---------------Ǭ������   ��û���3%
		itemname = "\212\240\243\234\242 \208\238\241\242\224 \212\229\233 (3\248\242)"
	elseif sc <=100 then
		GiveItem ( role , 0 ,7489 , 1 , 4 )                    ---------------��У֮��   ��û���1%
		itemname = "\202\238\240\238\225\234\224 \241 \192\243\240\224\236\232"	
	else   
		GiveItem ( role , 0 , 7510 , 3 , 4 )                   ---------------���ڻ�����־   ��û���1%
		itemname = "\208\224\241\239\232\241\234\224 \237\224 \241\224\236\238\246\226\229\242 +14 (3\248\242)"
	end
	local cha_name = GetChaDefaultName ( role )
	Notice ( "\200\227\240\238\234 " ..cha_name.. " \238\242\234\240\251\235 \241\243\237\228\243\234 \192\240\224\236\232\241\224, \232 \239\238\235\243\247\232\235 "..itemname )
end

function ItemUse_timqgemss ( role , Item ) 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
local rad = math.random ( 1, 5 )
	if rad == 1 then
	GiveItem ( role , 0 , 7615  , 1 , 5 ) 
	elseif rad == 2 then
	GiveItem ( role , 0 , 7616  , 1 , 5 )  
	elseif rad == 3 then
	GiveItem ( role , 0 , 7617  , 1 , 5 )  
	elseif rad == 4 then
	GiveItem ( role , 0 , 7618  , 1 , 5 ) 
	elseif rad == 5 then
	GiveItem ( role , 0 , 7619  , 1 , 5 ) 
	end	
end

function ItemUse_timshmotx ( role , Item ) 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
local rad = math.random ( 1, 5 )
	if rad == 1 then
	GiveItem ( role , 0 , 7925  , 1 , 5 ) 
	elseif rad == 2 then
	GiveItem ( role , 0 , 7926  , 1 , 5 )  
	elseif rad == 3 then
	GiveItem ( role , 0 , 7927  , 1 , 5 )  
	elseif rad == 4 then
	GiveItem ( role , 0 , 7928  , 1 , 5 ) 
	elseif rad == 5 then
	GiveItem ( role , 0 , 7929  , 1 , 5 ) 
	end	
end

-- ������� ������� +40
function ItemUse_timqgemshap ( role , Item ) 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
local rad = math.random ( 1, 5 )
	if rad == 1 then
	GiveItem ( role , 0 , 5225  , 1 , 5 ) 
	elseif rad == 2 then
	GiveItem ( role , 0 , 5226  , 1 , 5 )  
	elseif rad == 3 then
	GiveItem ( role , 0 , 5223  , 1 , 5 )  
	elseif rad == 4 then
	GiveItem ( role , 0 , 5224  , 1 , 5 ) 
	elseif rad == 5 then
	GiveItem ( role , 0 , 5222  , 1 , 5 ) 
	end	
end

-- ������ ��������� +50
function ItemUse_repa (role, Item )
	local Check_Rep = GetChaAttr(role, ATTR_FAME)
	SetCharaAttr(Check_Rep+50, role, ATTR_FAME) 
end
	
function ItemUse_chestplaw (role, Item )

		local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
local rad = math.random ( 1, 25 )
	if rad == 1 then
	GiveItem ( role , 0 , 7705  , 1 , 5 ) 
	elseif rad == 2 then
	GiveItem ( role , 0 , 7706  , 1 , 5 )  
	elseif rad == 3 then
	GiveItem ( role , 0 , 7707  , 1 , 5 )  
	elseif rad == 4 then
	GiveItem ( role , 0 , 7708  , 1 , 5 ) 
	elseif rad == 5 then
	GiveItem ( role , 0 , 7709  , 1 , 5 ) 
	elseif rad == 6 then
	GiveItem ( role , 0 , 7710  , 1 , 5 )  
	elseif rad == 7 then
	GiveItem ( role , 0 , 7711  , 1 , 5 )  
	elseif rad == 8 then
	GiveItem ( role , 0 , 7712  , 1 , 5 ) 
	elseif rad == 9 then
	GiveItem ( role , 0 , 7713  , 1 , 5 ) 
	elseif rad == 10 then
	GiveItem ( role , 0 , 7714  , 1 , 5 )  
	elseif rad == 11 then
	GiveItem ( role , 0 , 7715  , 1 , 5 )  
	elseif rad == 12 then
	GiveItem ( role , 0 , 7716  , 1 , 5 ) 
	elseif rad == 13 then
	GiveItem ( role , 0 , 7717  , 1 , 5 ) 
	elseif rad == 14 then
	GiveItem ( role , 0 , 7718  , 1 , 5 ) 
	elseif rad == 15 then
	GiveItem ( role , 0 , 7719  , 1 , 5 ) 
	elseif rad == 16 then
	GiveItem ( role , 0 , 7705  , 1 , 5 )  
	elseif rad == 17 then
	GiveItem ( role , 0 , 7706  , 1 , 5 )  
	elseif rad == 18 then
	GiveItem ( role , 0 , 7707  , 1 , 5 )  
	elseif rad == 19 then
	GiveItem ( role , 0 , 7708  , 1 , 5 ) 
	elseif rad == 20 then
	GiveItem ( role , 0 , 7709  , 1 , 5 ) 
	elseif rad == 21 then
	GiveItem ( role , 0 , 7705  , 1 , 5 )  
	elseif rad == 22 then
	GiveItem ( role , 0 , 7706  , 1 , 5 )  
	elseif rad == 23 then
	GiveItem ( role , 0 , 7707  , 1 , 5 )  
	elseif rad == 24 then
	GiveItem ( role , 0 , 7708  , 1 , 5 ) 
	elseif rad == 25 then
	GiveItem ( role , 0 , 7709  , 1 , 5 ) 
	end	
end	
	
-- ��������� ���������
function ItemUse_AddRep (role, Item)
	local Now_Reputation = GetChaAttr(role, ATTR_FAME)
	local NewReputation = 0
	local data

	RepPerItems = {}
	RepPerItems[1] = {7625, 10}
	RepPerItems[2] = {7622, 50}
	RepPerItems[3] = {7623, 100}
	RepPerItems[4] = {7624, 500}
	RepPerItems[5] = {7830, 1000}


	-- �������� �������
	for data in RepPerItems do
		if (GetItemID(Item) == RepPerItems[data][1]) then
			NewReputation = Now_Reputation + RepPerItems[data][2]
			SetCharaAttr(NewReputation, role, ATTR_FAME)
		end	
	end
end

function ItemUse_mewsfruits (role, Item)

	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	 if Item_CanGet < 1 then
		SystemNotice(role ,"\205\229\242 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224")
		UseItemFailed ( role )
		return
	end
	local	sc = math.random(1,100)
	local itemname = ""
	if  sc <=20 then	
		GiveItem ( role , 0 , 7504 , 1 , 4 )                    ---------------Ԫ˧֮��   ��û���20%
		itemname = "\244\240\243\234\242 \235\238\226\234\238\241\242\232"
	elseif sc <=40 then		
		GiveItem ( role , 0 , 7505 , 1 , 20 )                    ---------------�����֮צ   ��û���20%
		itemname = "\244\240\243\234\242 \241\232\235\251"
	elseif sc <=60 then
		GiveItem ( role , 0 ,7506 , 1 , 20 )                    ---------------�����֮��   ��û���20%
		itemname = "\244\240\243\234\242 \242\229\235\238\241\235\238\230\229\237\232\255"
	elseif sc <=80 then
		GiveItem ( role , 0 ,7507 , 1 , 4 )                    ---------------��˫����   ��û���15%
		itemname = "\244\240\243\234\242 \242\238\247\237\238\241\242\232"
	elseif sc <=100 then
		GiveItem ( role , 0 ,7508 , 1 , 20 )                    ---------------�����֮��   ��û���14%
		itemname = "\244\240\243\234\242 \228\243\245\224"
	end
	local cha_name = GetChaDefaultName ( role )
	Notice ( "\200\227\240\238\234 " ..cha_name.." \238\242\234\240\251\235 \236\229\248\238\234 \241 \235\229\227\229\237\228\224\240\237\251\236 \244\240\243\234\242\238\236 \244\229\232, \232 \239\238\235\243\247\232\235 "..itemname )
end

function ItemUse_mewsfruitt (role, Item)

	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	 if Item_CanGet < 1 then
		SystemNotice(role ,"\205\229\242 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224")
		UseItemFailed ( role )
		return
	end
	local	sc = math.random(1,100)
	local itemname = ""
	if  sc <=20 then	
		GiveItem ( role , 0 , 7523 , 1 , 4 )                    ---------------Ԫ˧֮��   ��û���20%
		itemname = "\236\232\244\232\247\229\241\234\232\233 \244\240\243\234\242 \242\229\235\238\241\235\238\230\229\237\232\255 "
	elseif sc <=40 then		
		GiveItem ( role , 0 , 7524 , 1 , 20 )                    ---------------�����֮צ   ��û���20%
		itemname = "\236\232\244\232\247\229\241\234\232\233 \244\240\243\234\242 \235\238\226\234\238\241\242\232 "
	elseif sc <=60 then
		GiveItem ( role , 0 ,7525 , 1 , 20 )                    ---------------�����֮��   ��û���20%
		itemname = "\236\232\244\232\247\229\241\234\232\233 \244\240\243\234\242 \241\232\235\251 "
	elseif sc <=80 then
		GiveItem ( role , 0 ,7526 , 1 , 4 )                    ---------------��˫����   ��û���15%
		itemname = "\236\232\244\232\247\229\241\234\232\233 \244\240\243\234\242 \242\238\247\237\238\241\242\232 "
	elseif sc <=100 then
		GiveItem ( role , 0 ,7527 , 1 , 20 )                    ---------------�����֮��   ��û���14%
		itemname = "\236\232\244\232\247\229\241\234\232\233 \244\240\243\234\242 \228\243\245\224 "
	end
	local cha_name = GetChaDefaultName ( role )
	Notice ( "\200\227\240\238\234 " ..cha_name.." \238\242\234\240\251\235 \236\229\248\238\234 \241 \236\232\244\232\247\229\241\234\232\236 \244\240\243\234\242\238\236 \244\229\232, \232 \239\238\235\243\247\232\235 "..itemname )
end

function ItemUse_mewsfraddtim (role, Item)

	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	 if Item_CanGet < 1 then
		SystemNotice(role ,"\205\229\242 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224")
		UseItemFailed ( role )
		return
	end
	local	sc = math.random(1,100)
	local itemname = ""
	if  sc <=20 then	
		GiveItem ( role , 0 , 7831 , 1 , 4 )                    ---------------Ԫ˧֮��   ��û���20%
		itemname = "\225\238\230\229\241\242\226\229\237\237\251\233 \244\240\243\234\242 \242\229\235\238\241\235\238\230\229\237\232\255 "
	elseif sc <=40 then		
		GiveItem ( role , 0 , 7832 , 1 , 20 )                    ---------------�����֮צ   ��û���20%
		itemname = "\224\228\241\234\232\233 \244\240\243\234\242 \235\238\226\234\238\241\242\232 "
	elseif sc <=60 then
		GiveItem ( role , 0 ,7833 , 1 , 20 )                    ---------------�����֮��   ��û���20%
		itemname = "\224\228\241\234\232\233 \244\240\243\234\242 \241\232\235\251 "
	elseif sc <=80 then
		GiveItem ( role , 0 ,7834 , 1 , 4 )                    ---------------��˫����   ��û���15%
		itemname = "\224\228\241\234\232\233 \244\240\243\234\242 \242\238\247\237\238\241\242\232 "
	elseif sc <=100 then
		GiveItem ( role , 0 ,7835 , 1 , 20 )                    ---------------�����֮��   ��û���14%
		itemname = "\224\228\241\234\232\233 \244\240\243\234\242 \228\243\245\224 "
	end
	local cha_name = GetChaDefaultName ( role )
	Notice ( "\200\227\240\238\234 " ..cha_name.." \238\242\234\240\251\235 \236\229\248\238\234 \241 \224\228\241\234\232\236 \244\240\243\234\242\238\236 \244\229\232, \232 \239\238\235\243\247\232\235 "..itemname )
end


function ItemUse_mewsskorb (role, Item)

	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	 if Item_CanGet < 1 then
		SystemNotice(role ,"\205\229\242 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224")
		UseItemFailed ( role )
		return
	end
	local	sc = math.random(1,100)
	local itemname = ""
	if  sc <=20 then	
		GiveItem ( role , 0 , 7904 , 1 , 4 )                    ---------------Ԫ˧֮��   ��û���20%
		itemname = "\241\234\238\240\225\255\249\232\233 \244\240\243\234\242 \242\229\235\238\241\235\238\230\229\237\232\255 "
	elseif sc <=40 then		
		GiveItem ( role , 0 , 7905 , 1 , 20 )                    ---------------�����֮צ   ��û���20%
		itemname = "\241\234\238\240\225\255\249\232\233 \244\240\243\234\242 \235\238\226\234\238\241\242\232 "
	elseif sc <=60 then
		GiveItem ( role , 0 ,7906 , 1 , 20 )                    ---------------�����֮��   ��û���20%
		itemname = "\241\234\238\240\225\255\249\232\233 \244\240\243\234\242 \241\232\235\251 "
	elseif sc <=80 then
		GiveItem ( role , 0 ,7907 , 1 , 4 )                    ---------------��˫����   ��û���15%
		itemname = "\241\234\238\240\225\255\249\232\233 \244\240\243\234\242 \242\238\247\237\238\241\242\232 "
	elseif sc <=100 then
		GiveItem ( role , 0 ,7908 , 1 , 20 )                    ---------------�����֮��   ��û���14%
		itemname = "\241\234\238\240\225\255\249\232\233 \244\240\243\234\242 \228\243\245\224 "
	end
	local cha_name = GetChaDefaultName ( role )
	Notice ( "\200\227\240\238\234 " ..cha_name.." \238\242\234\240\251\235 \236\229\248\238\234 \241 \244\240\243\234\242\238\236 \241\234\238\240\225\232 \244\229\232, \232 \239\238\235\243\247\232\235 "..itemname )
end



function ItemUse_timkarta ( role , Item ) 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		UseItemFailed ( role )
		return
	end
local rad = math.random ( 1, 26 )
	if rad == 1 then
	GiveItem ( role , 0 , 3850  , 1 , 4 ) 
	elseif rad == 2 then
	GiveItem ( role , 0 , 3851  , 1 , 4 )  
	elseif rad == 3 then
	GiveItem ( role , 0 , 3852  , 1 , 4 )  
	elseif rad == 4 then
	GiveItem ( role , 0 , 3853  , 1 , 4 )  
	elseif rad == 5 then
	GiveItem ( role , 0 , 3854  , 1 , 4 ) 
	elseif rad == 6 then
	GiveItem ( role , 0 , 3855  , 1 , 4 ) 
	elseif rad == 7 then
	GiveItem ( role , 0 , 3856  , 1 , 4 ) 
	elseif rad == 8 then
	GiveItem ( role , 0 , 3857  , 1 , 4 ) 
	elseif rad == 9 then
	GiveItem ( role , 0 , 3858  , 1 , 4 ) 
	elseif rad == 10 then
	GiveItem ( role , 0 , 3859  , 1 , 4 ) 
	elseif rad == 11 then
	GiveItem ( role , 0 , 3860  , 1 , 4 ) 
	elseif rad == 12 then
	GiveItem ( role , 0 , 3861  , 1 , 4 ) 
	elseif rad == 13 then
	GiveItem ( role , 0 , 3862  , 1 , 4 ) 
	elseif rad == 14 then
	GiveItem ( role , 0 , 3863  , 1 , 4 ) 
	elseif rad == 15 then
	GiveItem ( role , 0 , 3864  , 1 , 4 ) 
	elseif rad == 16 then
	GiveItem ( role , 0 , 3865  , 1 , 4 ) 
	elseif rad == 17 then
	GiveItem ( role , 0 , 3866  , 1 , 4 )
	elseif rad == 18 then
	GiveItem ( role , 0 , 3867  , 1 , 4 )
	elseif rad == 19 then
	GiveItem ( role , 0 , 3868  , 1 , 4 )
	elseif rad == 20 then
	GiveItem ( role , 0 , 3869  , 1 , 4 )
	elseif rad == 21 then
	GiveItem ( role , 0 , 3870  , 1 , 4 )
	elseif rad == 22 then
	GiveItem ( role , 0 , 3871  , 1 , 4 )
	elseif rad == 23 then
	GiveItem ( role , 0 , 3872  , 1 , 4 )
	elseif rad == 24 then
	GiveItem ( role , 0 , 3873  , 1 , 4 )
	elseif rad == 25 then
	GiveItem ( role , 0 , 3874  , 1 , 4 )
	elseif rad == 26 then
	GiveItem ( role , 0 , 3875  , 1 , 4 )

end	
end

function ItemUse_weaponfrak( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224")
		--SystemNotice(role ,"����� ������� ������ ������ �� ������� ���� ��������� 1 ��������� ���� � ����� ���������")
		--SystemNotice(role ,"To open the Carcass of Death requires at least 1 empty inventory slot")
		UseItemFailed ( role )
		return
	end
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
	local star_rad=math.random ( 1, 1 )
	if lv < 1000 then
		SystemNotice(role ,"\194\224\248 \243\240\238\226\229\237\252 \237\232\230\229 \247\229\236 1000!")
		--SystemNotice(role ,"��� ������� ���� ��� 150. ���������� ������������ �������!")
		--SystemNotice(role ,"Currently lower than Lv 40. Unable to use item!")
		UseItemFailed ( role )	
	elseif job == 9 then 
			GiveItem ( role , 0 , 7796  , 1 , 4 ) 
		
	elseif job == 8 then   
			GiveItem ( role , 0 , 7796  , 1 , 4 ) 
		
	elseif job == 12 then 
			GiveItem ( role , 0 , 7796  , 1 , 4 ) 
		
	elseif job == 16 then 
			GiveItem ( role , 0 , 7796  , 1 , 4 ) 
		
	elseif job == 13 then    
			GiveItem ( role , 0 , 7796  , 1 , 4 ) 
		
	elseif job == 14 then    
			GiveItem ( role , 0 , 7796  , 1 , 4 ) 
		
	else 
		SystemNotice(role ,"\207\240\229\228\236\229\242 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237 \242\238\235\252\234\238 \239\238\241\235\229 \226\251\225\238\240\224 \226\242\238\240\238\227\238 \238\241\237\238\226\237\238\227\238 \234\235\224\241\241\224!")
		--SystemNotice(role ,"������� ����� ���� ����������� ������ ����� ������ ������� ��������� ������!")
		--SystemNotice(role ,"Class mismatch. Item can only be used after second class advancement!")
		UseItemFailed ( role )	
	end
end

function ItemUse_weapontadd( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		SystemNotice(role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224")
		--SystemNotice(role ,"����� ������� ������ ������ �� ������� ���� ��������� 1 ��������� ���� � ����� ���������")
		--SystemNotice(role ,"To open the Carcass of Death requires at least 1 empty inventory slot")
		UseItemFailed ( role )
		return
	end
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
	local star_rad=math.random ( 1, 1 )
	if lv < 1200 then
		SystemNotice(role ,"\194\224\248 \243\240\238\226\229\237\252 \237\232\230\229 \247\229\236 1200!")
		--SystemNotice(role ,"��� ������� ���� ��� 150. ���������� ������������ �������!")
		--SystemNotice(role ,"Currently lower than Lv 40. Unable to use item!")
		UseItemFailed ( role )	
	elseif job == 9 then 
			GiveItem ( role , 0 , 3583  , 1 , 4 ) 
			GiveItem ( role , 0 , 3583  , 1 , 4 ) 
			GiveItem ( role , 0 , 3590  , 1 , 4 ) 
		
	elseif job == 8 then   
			GiveItem ( role , 0 , 3584  , 1 , 4 ) 
			GiveItem ( role , 0 , 3592  , 1 , 4 ) 
			GiveItem ( role , 0 , 3592  , 1 , 4 ) 
			GiveItem ( role , 0 , 3590  , 1 , 4 ) 
		
	elseif job == 12 then 
			GiveItem ( role , 0 , 3585  , 1 , 4 ) 
			GiveItem ( role , 0 , 3586  , 1 , 4 )  
		
	elseif job == 16 then 
			GiveItem ( role , 0 , 3589  , 1 , 4 ) 
		
	elseif job == 13 then    
			GiveItem ( role , 0 , 3588  , 1 , 4 ) 
		
	elseif job == 14 then    
			GiveItem ( role , 0 , 3587  , 1 , 4 ) 
		
	else 
		SystemNotice(role ,"\207\240\229\228\236\229\242 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237 \242\238\235\252\234\238 \239\238\241\235\229 \226\251\225\238\240\224 \226\242\238\240\238\227\238 \238\241\237\238\226\237\238\227\238 \234\235\224\241\241\224!")
		--SystemNotice(role ,"������� ����� ���� ����������� ������ ����� ������ ������� ��������� ������!")
		--SystemNotice(role ,"Class mismatch. Item can only be used after second class advancement!")
		UseItemFailed ( role )	
	end
end


function ItemUse_timdralsh ( role , Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 3662  , 1 , 4 ) 
	GiveItem ( role , 0 , 3663  , 1 , 4 )  
	GiveItem ( role , 0 , 3664  , 1 , 4 )  
end	

function ItemUse_timdaddw ( role , Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 3594  , 1 , 4 ) 
	GiveItem ( role , 0 , 3595  , 1 , 4 )  
	GiveItem ( role , 0 , 3596  , 1 , 4 )  
end	


function ItemUse_sword1 ( role , Item )
	
	GiveItem(role,0,3593,1,18) -- ItemID (Can be founded in iteminfo.txt)
	local Equip = GetChaItem2(role,2,3593)
        local param = GetItemForgeParam(Equip,1)
        local Item_Stone = {}
        local Item_StoneLv = {}
        local GemIDSlot01 = 63 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot02 = 55 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemIDSlot03 = 60 -- Gem Stone ID A ( Can be founded in stoneinfo.txt )
        local GemLevelSlot01 = 4 -- Gem Level - 1 ~ 9
        local GemLevelSlot02 = 6-- Gem Level - 1 ~ 9
        local GemLevelSlot03 = 4-- Gem Level - 1 ~ 9

        param = TansferNum(param)
        Item_Stone[0] = GetNum_Part2(param)
        Item_StoneLv[0] = GetNum_Part3(param)
        Item_Stone[0] = GemIDSlot01
        Item_StoneLv[0] = GemLevelSlot01  
        param = SetNum_Part2(param,Item_Stone[0])
        param = SetNum_Part3(param,Item_StoneLv[0])
        SetItemForgeParam(Equip,1,param)

        param = TansferNum(param)
        Item_Stone[1] = GetNum_Part2(param)
        Item_StoneLv[1] = GetNum_Part3(param)
        Item_Stone[1] = GemIDSlot02  
        Item_StoneLv[1] = GemLevelSlot02
        param = SetNum_Part4(param, Item_Stone[1])  
        param = SetNum_Part5(param, Item_StoneLv[1])  
        SetItemForgeParam(Equip, 1, param)

        param = TansferNum(param)
        Item_Stone[2] = GetNum_Part2(param)
        Item_StoneLv[2] = GetNum_Part3(param)
        Item_Stone[2] = GemIDSlot03  
        Item_StoneLv[2] = GemLevelSlot03
        param = SetNum_Part6(param,Item_Stone[2])  
        param = SetNum_Part7(param,Item_StoneLv[2])
        SetItemForgeParam(Equip,1,param)

        local Socket = GetItemForgeParam(Equip,1)
        Socket = TansferNum(Socket)
        Socket = SetNum_Part1(Socket,3)
        SetItemForgeParam(Equip,1,Socket)
        RefreshCha(role)
     
end

--7658	������ ������������ �������
function Stone_shacity(role, Item )
	local i = CheckBagItem(role,7658)
	local k = ChaIsBoat(role)
	if k == 0 then
		if i > 0 then
			MoveCity(role,"Shaitan City")
			return
		end
	else
		UseItemFailed ( role )
	end
	local map_name = GetChaMapName ( role )
	if map_name == "Pkteam" then
	SystemNotice ( role , "\194\251 \237\224\245\238\228\232\242\229\241\252 \226 \242\254\240\252\236\229. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \225\232\235\229\242" )
                 --SystemNotice ( role , "�� ���������� � ������. ���������� ������������ �����" )
		UseItemFailed ( role )
		return
	end
	end
	
	function Sk_Script_Byl ( role , Item )
	local Skill = 495 -- Skill ID 
	local form_sklv = GetSkillLv( role , Skill )
    if form_sklv ~= 0  then
        UseItemFailed ( role ) 
        return
    end
	local lifesk = GetChaAttr (role, ATTR_LIFETP)
	if lifesk < 1 then
		BickerNotice(role,"\205\229\228\238\241\242\224\242\238\247\237\238 \238\247\234\238\226 \236\232\240\237\251\245 \237\224\226\251\234\238\226!")	
		UseItemFailed ( role )
		return
	end
	BickerNotice(role,"\200\231\243\247\229\237 \237\224\226\251\234 \208\251\225\224\235\234\224 ")
    a = AddChaSkill ( role , Skill, 1 , 1 , 1 )
    if a== 0 then
        UseItemFailed ( role ) 
        return
    end
end

function Sk_Script_DS   ( role , Item )
    local Item_CanGet = GetChaFreeBagGridNum ( role )
    if Item_CanGet < 1 then
        UseItemFailed ( role )
        SystemNotice(role ,"\194\224\236 \237\243\230\229\237 1 \241\226\238\225\238\228\237\251\233 \241\235\238\242 \226 \232\237\226\229\237\242\224\240\229, \247\242\238\225\251 \226\251\243\247\232\242\252 \253\242\238 \243\236\229\237\232\229")
        --SystemNotice(role ,"��� ����� 1 ��������� ���� � ���������, ����� ������� ��� ������")
        return
    end
    local sk_add = SK_DS  
    local form_sklv = GetSkillLv( role , sk_add )
     
    if form_sklv ~= 0  then
        UseItemFailed ( role )  
        return
    end
    a = AddChaSkill ( role , sk_add, 1 , 1 , 1 )               
    if a== 0 then
        UseItemFailed ( role )  
        return
    end
   
    local r1 = 0
    local r2 = 0
    r1, r2 = MakeItem ( role , 3289 , 1 , 4 )               -- ������������ �����
    local Itemnew = GetChaItem ( role , 2 , r2 )
 
    SetItemAttr(Itemnew, ITEMATTR_MAXENERGY , 120)          
    SetItemAttr(Itemnew, ITEMATTR_ENERGY , 0 )                               
    SetItemAttr(Itemnew, ITEMATTR_URE,0)                                 
    SetItemAttr(Itemnew, ITEMATTR_MAXURE,150)                      
    SetItemAttr(Itemnew, ITEMATTR_FORGE,0)                             
   
    LiveSkillLearnLog(role, 461)
end
 
function ItemUse_WisdomApple( role , Item )    
    local Lv = Lv( role )
    if Lv < 40 then
        SystemNotice(role ,"\207\229\240\241\238\237\224\230\232 \237\232\230\229 40 \243\240\238\226\237\255 \237\229 \236\238\227\243\242 \232\241\239\238\235\252\231\238\226\224\242\252 \212\240\243\234\242 \240\224\231\243\236\224")
        --SystemNotice(role ,"��������� ���� 40 ������ �� ����� ������������ ����� ������")
        UseItemFailed ( role )
        return
    end
 
    local statelv = 1
    local ChaStateLv = GetChaStateLv ( role , STATE_APPLE )
   
    if ChaStateLv > statelv then
        SystemNotice ( role , "\200\241\239\238\235\252\231\243\229\242\241\255 \225\238\235\229\229 \236\238\249\237\251\233 \243\241\232\235\232\242\229\235\252. \207\238\239\240\238\225\243\233\242\229 \239\238\231\230\229." )
        --SystemNotice ( role , "������������ ����� ������ ���������. ���������� �����." )
        UseItemFailed ( role )
        return
    end
 
    local statetime = 1800
    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
--  SystemNotice( role , Cha_Boat )
    if Cha_Boat ==  nil then
        AddState( role , role , STATE_APPLE , statelv , statetime )
    else
        UseItemFailed ( role )
        SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
        --SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
    end
end
 
function ItemUse_GoldApple ( role , Item )
    local Lv = Lv( role )
    if Lv < 60 then
        SystemNotice(role ,"\207\229\240\241\238\237\224\230\232 \237\232\230\229 60 \243\240\238\226\237\255 \237\229 \236\238\227\243\242 \232\241\239\238\235\252\231\238\226\224\242\252 \199\238\235\238\242\238\229 \255\225\235\238\234\238")
        --SystemNotice(role ,"��������� ���� 60 ������ �� ����� ������������ ������� ������")
        UseItemFailed ( role )
        return
    end
 
    local statelv = 2
    local ChaStateLv = GetChaStateLv ( role , STATE_APPLE )
   
    if ChaStateLv > statelv then
        SystemNotice ( role , "\200\241\239\238\235\252\231\243\229\242\241\255 \225\238\235\229\229 \236\238\249\237\251\233 \243\241\232\235\232\242\229\235\252. \207\238\239\240\238\225\243\233\242\229 \239\238\231\230\229." )
        --SystemNotice ( role , "������������ ����� ������ ���������. ���������� �����." )
        UseItemFailed ( role )
        return
    end
 
    local statetime = 1800
    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
--  SystemNotice( role , Cha_Boat )
    if Cha_Boat ==  nil then
        AddState( role , role , STATE_APPLE , statelv , statetime )
    else
        UseItemFailed ( role )
        SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
        --SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
    end
end

function ItemUse_Timgold100( role , Item ) 							
 	local Money_add = 100000000
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Have>=1899900000 then
		SystemNotice (role, "\211 \194\224\241 \241\235\232\248\234\238\236 \236\237\238\227\238 \231\238\235\238\242\224. \205\229\226\238\231\236\238\230\237\238 \232\241\239\238\235\252\231\238\226\224\242\252 \239\240\229\228\236\229\242")
		--SystemNotice (role, "� ��� ������� ����� ������. ���������� ������������ �������)
		--SystemNotice (role, "Your account is saturated. Unable to use item")
		UseItemFailed ( role )
		return	
	end
	AddMoney ( role , 0 , Money_add )
end 

function ItemUse_chestzzzzz( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6262  , 1 , 4 ) 
	GiveItem ( role , 0 , 6263  , 1 , 4 )  
	GiveItem ( role , 0 , 6264  , 1 , 4 )  
end	

function ItemUse_chestzzzzx( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6265  , 1 , 4 ) 
	GiveItem ( role , 0 , 6266  , 1 , 4 )  
	GiveItem ( role , 0 , 6267  , 1 , 4 )  
	GiveItem ( role , 0 , 6268  , 1 , 4 )
end	

function ItemUse_chestzzzzc( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6269  , 1 , 4 ) 
	GiveItem ( role , 0 , 6270  , 1 , 4 )  
	GiveItem ( role , 0 , 6271  , 1 , 4 )  
end	

function ItemUse_chestzzzzv( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6273  , 1 , 4 ) 
	GiveItem ( role , 0 , 6272  , 1 , 4 )  
	GiveItem ( role , 0 , 6274  , 1 , 4 )  
end	

function ItemUse_chestzzzzb( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6275  , 1 , 4 ) 
	GiveItem ( role , 0 , 6276  , 1 , 4 )  
	GiveItem ( role , 0 , 6277  , 1 , 4 )  
end	

function ItemUse_chestzzzzn( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6278  , 1 , 4 ) 
	GiveItem ( role , 0 , 6279  , 1 , 4 )  
	GiveItem ( role , 0 , 6280  , 1 , 4 )  
end	

function ItemUse_chestzzzzm( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6281  , 1 , 4 ) 
	GiveItem ( role , 0 , 6282  , 1 , 4 )  
	GiveItem ( role , 0 , 6283  , 1 , 4 )  
	GiveItem ( role , 0 , 6284  , 1 , 4 )
end	

function ItemUse_chestzzzza( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6285  , 1 , 4 ) 
	GiveItem ( role , 0 , 6286  , 1 , 4 )  
	GiveItem ( role , 0 , 6287  , 1 , 4 ) 
	GiveItem ( role , 0 , 6288  , 1 , 4 )	
end	

function ItemUse_chestzzzzs( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6289  , 1 , 4 ) 
	GiveItem ( role , 0 , 6290  , 1 , 4 )  
	GiveItem ( role , 0 , 6291  , 1 , 4 )  
end	

function ItemUse_chestzzzzf( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6990  , 1 , 4 ) 
	GiveItem ( role , 0 , 6991  , 1 , 4 )  
	GiveItem ( role , 0 , 6992  , 1 , 4 )  
end	

function ItemUse_chestzzzzd( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6987  , 1 , 4 ) 
	GiveItem ( role , 0 , 6988  , 1 , 4 )  
	GiveItem ( role , 0 , 6989  , 1 , 4 )  
end	

function ItemUse_chestzzzzg( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6704  , 1 , 4 ) 
	GiveItem ( role , 0 , 6705  , 1 , 4 )  
	GiveItem ( role , 0 , 6706  , 1 , 4 )
	GiveItem ( role , 0 , 6707  , 1 , 4 )	
end	

function ItemUse_chestzzzzh( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6708  , 1 , 4 ) 
	GiveItem ( role , 0 , 6709  , 1 , 4 )  
	GiveItem ( role , 0 , 6710  , 1 , 4 )
	GiveItem ( role , 0 , 6711  , 1 , 4 )	
end	

function ItemUse_chestzzzzj( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6712  , 1 , 4 ) 
	GiveItem ( role , 0 , 6713  , 1 , 4 )  
	GiveItem ( role , 0 , 6714  , 1 , 4 )  
end	

function ItemUse_chestzzzzk( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6715  , 1 , 4 ) 
	GiveItem ( role , 0 , 6716  , 1 , 4 )  
	GiveItem ( role , 0 , 6717  , 1 , 4 )  
end	

function ItemUse_chestzzzzl( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6718  , 1 , 4 ) 
	GiveItem ( role , 0 , 6719  , 1 , 4 )  
	GiveItem ( role , 0 , 6720  , 1 , 4 )  
end	

function ItemUse_chestzzzzq( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6721  , 1 , 4 ) 
	GiveItem ( role , 0 , 6722  , 1 , 4 )  
	GiveItem ( role , 0 , 6723  , 1 , 4 )  
end	

function ItemUse_chestzzzzw( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6724  , 1 , 4 ) 
	GiveItem ( role , 0 , 6725  , 1 , 4 )  
	GiveItem ( role , 0 , 6726  , 1 , 4 ) 
	GiveItem ( role , 0 , 6727  , 1 , 4 ) 	
end	

function ItemUse_chestzzzze( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6728  , 1 , 4 ) 
	GiveItem ( role , 0 , 6729  , 1 , 4 )  
	GiveItem ( role , 0 , 6730  , 1 , 4 )  
end	

function ItemUse_chestzzzzr( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6731  , 1 , 4 ) 
	GiveItem ( role , 0 , 6732  , 1 , 4 )  
	GiveItem ( role , 0 , 6733  , 1 , 4 )  
end	

function ItemUse_chestzzzzt( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6734  , 1 , 4 ) 
	GiveItem ( role , 0 , 6735  , 1 , 4 )  
	GiveItem ( role , 0 , 6736  , 1 , 4 )  
end	

function ItemUse_chestzzzzy( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6737  , 1 , 4 ) 
	GiveItem ( role , 0 , 6738  , 1 , 4 )  
	GiveItem ( role , 0 , 6739  , 1 , 4 )  
end	

function ItemUse_chestzzzzu( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6740  , 1 , 4 ) 
	GiveItem ( role , 0 , 6741  , 1 , 4 )  
	GiveItem ( role , 0 , 6742  , 1 , 4 )  
	GiveItem ( role , 0 , 6743  , 1 , 4 )  
end	

function ItemUse_chestzzzzi( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6744  , 1 , 4 ) 
	GiveItem ( role , 0 , 6745  , 1 , 4 )  
	GiveItem ( role , 0 , 6746  , 1 , 4 )  
	GiveItem ( role , 0 , 6747  , 1 , 4 )
end	

function ItemUse_chestzzzzo( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6748  , 1 , 4 ) 
	GiveItem ( role , 0 , 6749  , 1 , 4 )  
	GiveItem ( role , 0 , 6750  , 1 , 4 )  
end	

function ItemUse_chestzzzzp( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6751  , 1 , 4 ) 
	GiveItem ( role , 0 , 6752  , 1 , 4 )  
	GiveItem ( role , 0 , 6753  , 1 , 4 )  
end	

function ItemUse_chestzzzqq( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6754  , 1 , 4 ) 
	GiveItem ( role , 0 , 6755  , 1 , 4 )  
	GiveItem ( role , 0 , 6756  , 1 , 4 ) 
	GiveItem ( role , 0 , 6757  , 1 , 4 ) 	
end	

function ItemUse_chestzzzww( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6758  , 1 , 4 ) 
	GiveItem ( role , 0 , 6759  , 1 , 4 )  
	GiveItem ( role , 0 , 6760  , 1 , 4 )  
end	

function ItemUse_chestzzzee( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6761  , 1 , 4 ) 
	GiveItem ( role , 0 , 6762  , 1 , 4 )  
	GiveItem ( role , 0 , 6763  , 1 , 4 )  
end	

function ItemUse_chestzzzrr( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6764  , 1 , 4 ) 
	GiveItem ( role , 0 , 6765  , 1 , 4 )  
	GiveItem ( role , 0 , 6766  , 1 , 4 )  
end	

function ItemUse_chestzzztt( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6767  , 1 , 4 ) 
	GiveItem ( role , 0 , 6768  , 1 , 4 )  
	GiveItem ( role , 0 , 6769  , 1 , 4 ) 
	GiveItem ( role , 0 , 6770  , 1 , 4 ) 	
end	

function ItemUse_chestzzzyy( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6771  , 1 , 4 ) 
	GiveItem ( role , 0 , 6772  , 1 , 4 )  
	GiveItem ( role , 0 , 6773  , 1 , 4 )  
end	

function ItemUse_chestzzzuu( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6774  , 1 , 4 ) 
	GiveItem ( role , 0 , 6775  , 1 , 4 )  
	GiveItem ( role , 0 , 6776  , 1 , 4 )
	GiveItem ( role , 0 , 6777  , 1 , 4 )	
end	

function ItemUse_chestzzzii( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6778  , 1 , 4 ) 
	GiveItem ( role , 0 , 6779  , 1 , 4 )  
	GiveItem ( role , 0 , 6780  , 1 , 4 )
	GiveItem ( role , 0 , 6781  , 1 , 4 )	
end	

function ItemUse_chestzzzoo( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6782  , 1 , 4 ) 
	GiveItem ( role , 0 , 6783  , 1 , 4 )  
	GiveItem ( role , 0 , 6784  , 1 , 4 )
	GiveItem ( role , 0 , 6785  , 1 , 4 )	
end	

function ItemUse_chestzzzpp( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6786  , 1 , 4 ) 
	GiveItem ( role , 0 , 6787  , 1 , 4 )  
	GiveItem ( role , 0 , 6788  , 1 , 4 )  
end	

function ItemUse_chestzzzaa( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6789  , 1 , 4 ) 
	GiveItem ( role , 0 , 6791  , 1 , 4 )  
	GiveItem ( role , 0 , 6792  , 1 , 4 )
	GiveItem ( role , 0 , 6793  , 1 , 4 )	
end	

function ItemUse_chestzzzss( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6794  , 1 , 4 ) 
	GiveItem ( role , 0 , 6795  , 1 , 4 )  
	GiveItem ( role , 0 , 6796  , 1 , 4 )
	GiveItem ( role , 0 , 6795  , 1 , 4 )	
end	

function ItemUse_chestzzzdd( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6797  , 1 , 4 ) 
	GiveItem ( role , 0 , 6798  , 1 , 4 )  
	GiveItem ( role , 0 , 6799  , 1 , 4 )  
end	

function ItemUse_chestzzzff( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6800  , 1 , 4 ) 
	GiveItem ( role , 0 , 6801  , 1 , 4 )  
	GiveItem ( role , 0 , 6802  , 1 , 4 )  
end	

function ItemUse_cheststopq( role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 6981  , 1 , 4 ) 
	GiveItem ( role , 0 , 7487  , 1 , 4 )  
	GiveItem ( role , 0 , 7487  , 1 , 4 )
	GiveItem ( role , 0 , 7487  , 1 , 4 )	
end	

function ItemUse_tckorb(role , Item)
local map_name_role = GetChaMapName ( role )
local Cha_Boat = 0
      Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		HelpInfo(role,0, "\207\240\232\231\251\226 \226 \225\229\231\238\239\224\241\237\238\233 \231\238\237\229 \231\224\239\240\229\249\229\237!" )
		--SystemNotice( role , "���������� � ���������� ����? ��� �����!" )
		--SystemNotice( role , "Training in Safe Zone? Dream on!" )
		UseItemFailed ( role )
                return
	end
   if  map_name_role == "farmer1" then
	local x,y = GetChaPos(role)
	if GetChaGuildID(role) <= 200 and GetChaGuildID(role) >= 0 then
	local MonsterID = 1666
	local Refresh = 1300
	local life = 1200000
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
	SetChaLifeTime( new, life )
	SetChaSideID(new,1)
	end
	else
        HelpInfo(role,0, "\207\240\232\231\251\226 \196\240\224\234\238\237\224 \209\234\238\240\225\232 \226\238\231\236\238\230\229\237 \235\232\248\252 \237\224   \206\241\242\240\238\226\229 \209\234\238\240\225\232" )
		--SystemNotice( role , "���� ������� ����� ���� ����������� ������ �� ���������� ��������� �����" )
		--SystemNotice( role , "This ticket can only be used in Sacred War map" )
        UseItemFailed ( role )
        return
    end
end


function ItemUse_checkorbq ( role, Item )
	if GetChaFreeBagGridNum (role) < 1 then
		HelpInfo(role, 0, "����� ������� ["..GetItemName(GetItemID(Item)).."] ����� ����� 1 ��������� ���� � ���������! ")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 7482  , 10 , 5 ) 
end

--��������� �������� (ID 3074)
function ItemUse_Ltimkks ( role , Item )
	local statelv = 10
	local statetime = 60
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_JLGLJB , statelv , statetime )
	else
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

--�������������� ����������� (ID 3075)
function ItemUse_Htimkkd ( role , Item )
	local statelv = 10
	local statetime = 60
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_HCGLJB , statelv , statetime )
	else
		SystemNotice( role , "\205\229 \236\238\230\229\242 \225\251\242\252 \232\241\239\238\235\252\231\238\226\224\237\238, \234\238\227\228\224 \194\251 \226 \236\238\240\229" )
		--SystemNotice( role , "�� ����� ���� ������������, ����� �� � ����" )
		--SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end


function ItemUse_chttplche (role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		--SystemNotice( role ,"������������ ��������� ������ � ���������")
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 7720  , 10 , 4  ) 

end

function ItemUse_chertejtx (role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		--SystemNotice( role ,"������������ ��������� ������ � ���������")
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1000  , 10 , 4  ) 

end

function ItemUse_chertetrt (role, Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		--SystemNotice( role ,"������������ ��������� ������ � ���������")
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1001  , 10 , 4  ) 

end

function ItemUse_chestkrlla (role, Item )

	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	local rad = math.random ( 1, 5 )
	if rad == 1 then
	GiveItem ( role , 0 , 7950  , 1 , 5 ) 
	elseif rad == 2 then
	GiveItem ( role , 0 , 7951  , 1 , 5 )  
	elseif rad == 3 then
	GiveItem ( role , 0 , 7952  , 1 , 5 )  
	elseif rad == 4 then
	GiveItem ( role , 0 , 7953  , 1 , 5 ) 
	elseif rad == 5 then
	GiveItem ( role , 0 , 7954  , 1 , 5 ) 
	end	
end	

--����� ���� ��� ���

function ItemUse_ExpX5( role , Item )
	local statelv = 7 --x5
    local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
    if ChaStateLv >= statelv then
        SystemNotice ( role , "����� ����������� ��� ����������� ��������� ����� ��� ������������" )
        UseItemFailed ( role )
        return
    end
    local statetime = 600
    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
    if Cha_Boat ==  nil then
        AddState( role , role , STATE_SBJYGZ , statelv , statetime )
    else
        AddState( Cha_Boat , Cha_Boat , STATE_SBJYGZ , statelv , statetime )
    end
    SystemNotice ( role ,"\207\238\235\243\247\224\229\236\251\233 \238\239\251\242 \243\226\229\235\232\247\229\237 \226 4 \240\224\231\224 " )
	local effect = 943              -- ID ������� �� sceneffectinfo.txt
    PlayEffect (role, effect )      -- ���������� ����������� ������ ��� �������� �������
end

function ItemUse_ExpX6( role , Item )
	local statelv = 8 --x6
    local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
    if ChaStateLv >= statelv then
        SystemNotice ( role , "����� ����������� ��� ����������� ��������� ����� ��� ������������" )
        UseItemFailed ( role )
        return
    end
    local statetime = 600
    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
    if Cha_Boat ==  nil then
        AddState( role , role , STATE_SBJYGZ , statelv , statetime )
    else
        AddState( Cha_Boat , Cha_Boat , STATE_SBJYGZ , statelv , statetime )
    end
    SystemNotice ( role ,"\207\238\235\243\247\224\229\236\251\233 \238\239\251\242 \243\226\229\235\232\247\229\237 \226 4 \240\224\231\224 " )
	local effect = 943              -- ID ������� �� sceneffectinfo.txt
    PlayEffect (role, effect )      -- ���������� ����������� ������ ��� �������� �������
end

function ItemUse_ExpX7( role , Item )
	local statelv = 9 --x7
    local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
    if ChaStateLv >= statelv then
        SystemNotice ( role , "����� ����������� ��� ����������� ��������� ����� ��� ������������" )
        UseItemFailed ( role )
        return
    end
    local statetime = 600
    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
    if Cha_Boat ==  nil then
        AddState( role , role , STATE_SBJYGZ , statelv , statetime )
    else
        AddState( Cha_Boat , Cha_Boat , STATE_SBJYGZ , statelv , statetime )
    end
    SystemNotice ( role ,"\207\238\235\243\247\224\229\236\251\233 \238\239\251\242 \243\226\229\235\232\247\229\237 \226 4 \240\224\231\224 " )
	local effect = 943              -- ID ������� �� sceneffectinfo.txt
    PlayEffect (role, effect )      -- ���������� ����������� ������ ��� �������� �������
end

function ItemUse_ExpX8( role , Item )
	local statelv = 10 --x8
    local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
    if ChaStateLv >= statelv then
        SystemNotice ( role , "����� ����������� ��� ����������� ��������� ����� ��� ������������" )
        UseItemFailed ( role )
        return
    end
    local statetime = 600
    local Cha_Boat = 0
    Cha_Boat = GetCtrlBoat ( role )
    if Cha_Boat ==  nil then
        AddState( role , role , STATE_SBJYGZ , statelv , statetime )
    else
        AddState( Cha_Boat , Cha_Boat , STATE_SBJYGZ , statelv , statetime )
    end
    SystemNotice ( role ,"\207\238\235\243\247\224\229\236\251\233 \238\239\251\242 \243\226\229\235\232\247\229\237 \226 4 \240\224\231\224 " )
	local effect = 943              -- ID ������� �� sceneffectinfo.txt
    PlayEffect (role, effect )      -- ���������� ����������� ������ ��� �������� �������
end

-------���������---------
function ItemUse_Kontrakt (role, Item )
	-- ID �������, �������� ����� �����
	local mob_id = GetItemAttr(Item, ITEMATTR_VAL_STR)
	-- ���-�� ��������, ������� ����� �����
	local kill_count = GetItemAttr(Item, ITEMATTR_VAL_AGI)
	-- �������� ����� ���������
	local kontrakt_num = GetItemAttr(Item, ITEMATTR_VAL_CON)
	--��� �������� ������� ������ � ������� ����������
	if (mob_id > 0) then
		if (kill_count > 0) then
			HelpInfo(role, 0, "��� ���������� ��������� �������� ����� x "..kill_count.." ��������.")
			UseItemFailed(role)
		else
			-- ��������� ������ ���������� � ������ ������ ����� --
			-- ��������� ������ �� ������� ������� ���������
			local CheckALLKontr
			for CheckALLKontr in KonPrize do
				--��������, ����� ������ ��� ��������
				if (kontrakt_num == KonPrize[CheckALLKontr][1]) then
					--������ ID ���� � ���� ���������
					if mob_id == KonPrize[CheckALLKontr][2] then
						--����� ���� �� ������� � �����������
						local Kontr_Prize = KonPrize[CheckALLKontr][3]
						--local PrizeName = GetItemName ( Kontr_Prize )
						GiveItem ( role , 0 , Kontr_Prize  , 1 , 4 )
						PopupNotice(role, "������ ������� �� ��������� ["..kontrakt_num.."] - "..PrizeName.."!")
					end
				end
			end
			--PopupNotice(role, "������ ������� �� ��������� ["..kontrakt_num.."] - "..GetItemName(Kontr_Prize).."!")
		end
	else
		PopupNotice(role, "�������� ��� �� �������...")
		UseItemFailed(role)
	end
end

-- ������ ���������
function ItemUse_proff (role, Item )

-- if NPCperItems == 1 then
-- Talk(1 , "xxx")
-- elseif TEST == 2 then
-- Talk(1, "yyy")
	FakeNPC(role, 1)
end

--�������� �������
function ItemUse_NewbieChest (role, Item)
	local Random = math.random(1,3)
	local data
	Items = {}
	Items[1] = {5300}
	Items[2] = {5301}
	Items[3] = {5302}
	GiveItem(role, 0, Items[Random][1], Random, 4)
end

--�������� ����� �������(+500)
function ItemUse_NewbieDamage (role, Item)
	local statelv = 2
	local statetime = 900
	AddState( role , role , STATE_PKZDYS , statelv , statetime )
	EffectPanel_Add(role, "STATE_PKZDYS", 1, "newbiedmg", EffectPanel_TimeConvertor(statetime))
end

--�������� ������ �������(+400)
function ItemUse_NewbieDefence (role, Item)
	local statelv = 2
	local statetime = 900
	AddState( role , role , STATE_PKSFYS , statelv , statetime )
	EffectPanel_Add(role, "STATE_PKSFYS", 1, "newbiedef", EffectPanel_TimeConvertor(statetime))
end

--�������� �������� ���� �������
function ItemUse_NewbieSpeed (role, Item)
	local statelv = 1
	local statetime = 900
	AddState( role , role , STATE_YSMspd , statelv , statetime )
	EffectPanel_Add(role, "STATE_YSMspd", statelv, "newbiespeed", EffectPanel_TimeConvertor(statetime))
end


--������ ��������� ��������� (ID 5200)
function ItemUse_PeshObit ( role , Item )
	local Random = math.random(1,100)
	local data
	Items = {}
	-- ������ ��� ����(10��)
	Items[1] = {7450} --25%
	-- �������� �� ���
	Items[2] = {3877} --25%
	-- ������ ���������
	Items[3] = {3362} --25%
	-- ������ �������
	Items[4] = {3087} --2%
	-- ����� ��������� ���������
	Items[5] = {7787} --1%
	--25% 1 ����
	if (Random <= 25) then
		GiveItem(role, 0, Items[1][1], 1, 4)
	--25% 2 ����
	elseif (Random >= 26 and Random <= 50) then
		GiveItem(role, 0, Items[2][1], 1, 4)
	--25% 3 ����
	elseif (Random >= 51 and Random <= 75) then
		GiveItem(role, 0, Items[3][1], 1, 4)
	--2% 4 ����
	elseif (Random >= 98 and Random <= 100) then
		GiveItem(role, 0, Items[4][1], 1, 4)
	--0,3% 5 ����
	elseif (Random == 97) then
		GiveItem(role, 0, Items[5][1], 1, 4)
	elseif (Random >= 76 and Random <= 96 ) then
		SystemNotice( role, "�� ������ �� ��������! ")
	end
	--������ �� 50� - 100%
	GiveItem(role, 0, 7491, 1, 4)
end 

--������ ��������� ��������� (ID 5201)
function ItemUse_PeshShit ( role , Item )
	local Random = math.random(1,100)
	local data
	Items = {}
	-- ������ ��� ����(50 ��)
	Items[1] = {7692} --33%
	-- ���� ���������� ���������
	Items[2] = {5702} --3%
	-- ������ ���������� ���������
	Items[3] = {5710} --3%
	-- ������ �������
	Items[4] = {3087} --3%
	--33% 1 ����
	if (Random <= 33) then
		GiveItem(role, 0, Items[1][1], 1, 4)
	--3% 3 ����
	elseif (Random >= 34 and Random <= 36) then
		GiveItem(role, 0, Items[2][1], 1, 4)
	--3% 4 ����
	elseif (Random >= 37 and Random <= 40) then
		GiveItem(role, 0, Items[3][1], 1, 4)
	--0,3% 5 ����
	elseif (Random == 41 or Random == 42) then
		GiveItem(role, 0, Items[4][1], 1, 4)
	elseif (Random >= 43 and Random <= 100 ) then
		SystemNotice( role, "�� ������ �� ��������! ")
	end
	--������ �� 50� - 100%
	GiveItem(role, 0, 7491, 1, 4)
end 


-- ���� �������� --
function ItemUse_ForgeItems ( role , Item )
	-- ���������� ��� �������� �������
	local data
	-- ��������� ������� � ������ �����
	local CheckItem = GetChaItem ( role , 1 , 1  )
	-- ����� ID ������
	local ScrollID = GetItemID(Item)
	-- ������ � ID ������ � ID ���������
	StoneByScroll = {}
	StoneByScroll = {Scroll = 5202, Gem = 5845}

	-- ���������� ������
	for data in StoneByScroll do
		-- ���� ID ������ ��������� � ID � �������
		if ScrollID == StoneByScroll[data].Scroll then
			
		end
	end

	local gem1_id = 5845
	local gem1_lv = 1
	ForgeItemInSlot(role, CheckItem, gem1_id, gem1_lv)
end

function UseLotteryTicket (role , item)
	local Random = math.random(1,100)
	Items = {}
	-- ������ ��� ����(50 ��)
	Items[1] = {7692} --33%
	-- ���� ���������� ���������
	Items[2] = {5702} --3%
	-- ������ ���������� ���������
	Items[3] = {5710} --3%
	-- ������ �� 50�
	Items[4] = {7491} --3%
	--33% 1 ����
	if (Random <= 33) then
		GiveItem(role, 0, Items[1][1], 1, 4)
	--3% 3 ����
	elseif (Random >= 34 and Random <= 36) then
		GiveItem(role, 0, Items[2][1], 1, 4)
	--3% 4 ����
	elseif (Random >= 37 and Random <= 40) then
		GiveItem(role, 0, Items[3][1], 1, 4)
	--0,3% 5 ����
	elseif (Random == 41 or Random == 42) then
		GiveItem(role, 0, Items[4][1], 1, 4)
	elseif (Random >= 43 and Random <= 100 ) then
		SystemNotice( role, "�� ������ �� ��������! ")
	end
end

function ItemUse_timnefr ( role , Item ) 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		--SystemNotice(role ,"������������ ��������� ������ � ���������)
		--SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
local rad = math.random ( 1, 3 )
	if rad == 1 then
	GiveItem ( role , 0 , 3087  , 10 , 4 ) 
	elseif rad == 2 then
	GiveItem ( role , 0 , 7492  , 5 , 3 )  
	elseif rad == 3 then
	GiveItem ( role , 0 , 7692  , 10 , 4 )  
	end	
end