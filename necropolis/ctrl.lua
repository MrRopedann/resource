

function config(map)
	MapCanSavePos(map, 1)							-- ����������� ��������� ������� ��������� �� ����� (1 - ��, 0 - ���)
	MapCanPK(map, 1) 								-- ����������� ��������� ������ ���������� (1 - ��, 0 - ���)
	MapCopyNum(map, 1)							-- ���������� ����� ����� (���� �������� �����������, ����������� ������ 1)
	SingleMapCopyPlyNum(map, 300)  					-- ���������� ���������� �� �����
	MapCanTeam(map , 1)							-- ����������� ��������� ������ �� ����� (1 - ��, 0 - ���)
	MapType ( map , 4 )							-- ��� �����
end


function get_map_entry_pos_necropolis()

end

function init_entry(map)

end

function after_enter_necropolis( role , map_copy )
end

function before_leave_necropolis( role )
end

function map_run_necropolis( map )
end

function map_copy_before_close_necropolis( map_copy )

end

function map_copy_close_necropolis( map_copy )
	ClearAllSubMapCha(map_copy)
end

function can_open_entry_necropolis( map )


end

function GiveSpecItem( role )

end