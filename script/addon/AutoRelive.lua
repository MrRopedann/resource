print "* Loading AutoRelive";

-- ����� � �������� �� ��������������� �����������
AUTO_RELIVE_TIME = 180 -- ������� �� ����-�����������

-- ������� ��� ������� �������
relive_counter = {}

-- ������� ����������� ������ �������
function relive_timer(role, freq, time)
	if IsPlayer(role) == 1 then
		if GetCtrlBoat(role) == nil then
			local cha_id = GetRoleID(role)
			if (Hp(role) <= 0) then
				if (relive_counter[cha_id] == nil) then
					relive_counter[cha_id] = AUTO_RELIVE_TIME
				else
					if (math.mod(relive_counter[cha_id], 10) == 0
							and relive_counter[cha_id] > 0) then
						SystemNotice(role, "\194\238\241\234\240\229\248\229\237\232\229 \247\229\240\229\231 (" .. relive_counter[cha_id] ..") \241\229\234.")
						--SystemNotice(role, "����������� ����� (" .. relive_counter[cha_id] ..") ���.")
					end

					relive_counter[cha_id] = relive_counter[cha_id] - 1
					if (relive_counter[cha_id] == 0) then
						ReliveCha(role)
						SystemNotice(role, "\194\251 \225\251\235\232 \226\238\241\234\240\229\248\229\237\251!")
						--SystemNotice(role, "�� ���� ����������!")
						relive_counter[cha_id] = nil
					end
				end
			else
				relive_counter[cha_id] = nil
			end
		end
	end
end

-- ���������� ���������
function ReliveCha(role)
	MoveCity(role, "")
	MoveCity(role, "")
	SetChaAttrI(role, ATTR_HP, 1)
	SetChaAttrI(role, ATTR_SP, 1)
	RefreshCha(role)
end

-- ������ ��� �� cha_timer
cha_timer_original1 = cha_timer
cha_timer = function(role, freq, time)
	relive_timer(role, freq, time)
	cha_timer_original1(role, freq, time)
end

-- ������ ��� �� ������� �����������
-- Skill_Fh_End_original = Skill_Fh_End
-- Skill_Fh_End = function(ATKER, DEFER, sklv)
		
	-- -- ���������� ���������...
	-- Skill_Fh_End_original(ATKER, DEFER, sklv)
	
	-- -- ���������� �������
	-- local cha_id = GetRoleID(DEFER)
	-- relive_counter[cha_id] = nil
	
-- end