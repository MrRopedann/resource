function config(map)
    MapCanSavePos(map, 0)		-- 1 = ��������� ������� ��������� respaw / / 0 = �� ��������� ������� ��������� respaw
    MapCopyNum(map, 1)			-- 1 ����� ����� ����� �������������� GameServer
    SingleMapCopyPlyNum(map, 300)	-- 300 ������ ����� ����� � �����
    MapCanTeam(map , 1)			-- 1 = ��������� ������� ��������� ������ / / 0 = �� ��������� ������� ��������� ��������
    MapType ( map , 1 )			-- 0 = ��� ��� // 1 = ��� ��� // 2 = ��� ���. ( ������ ����� ������������ � ����������� ) // 3 = ��� ���.( ����� ����� ����, ����� ����������� ) // 4 = ��� ���. ( ������ ����� ������������ � ����������� )        
end


function get_map_entry_pos_binglang2()   --���������� ���������� ������� � ����� ������

	local POS_X=2211
	local POS_Y=2748
	return POS_X , POS_Y

end

function init_entry(map)
    SetMapEntryMapName(map, "garner") --������ ��������� ������� � ����� ������
    SetMapEntryTime(map, "2010/7/28/0/0", "0/6/0", "0/3/0", "0/3/0") --����� ��������� ������� � ����� ������

end


function can_open_entry_binglang2( map ) 
--	local time = GetTickCount ( ) 
	local Now_Time = GetNowTime()
	if Now_Time == 0 or Now_Time == 6 or Now_Time == 12 or Now_Time == 18 then
		return 1
	else
		return 1
	end

end 