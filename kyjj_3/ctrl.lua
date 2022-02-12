--------------------------------------------------------------------------
--									--
--									--
--				ctrl.lua				--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading kyjj_3 Ctrl.lua" )

function config(map)
    MapCanSavePos(map, 0) --���õ�ͼ�Ƿ񱣴��ɫλ�ã���ͼ�����꣬���򣩣�������Ӱ��õ�ͼ�����и���
    MapCanPK(map, 1) --���õ�ͼ�Ƿ����PK��������Ӱ��õ�ͼ�����и���
    MapCopyNum(map, 1) --���õ�ͼ�ĸ�����Ŀ����������ø���䣬��ʹ��Ĭ��ֵ1
    SingleMapCopyPlyNum(map, 300)   --����һ�������������
	MapCanTeam(map , 1)
    MapType ( map , 4 )
end

function get_map_entry_pos_kyjj_3()   --������ڵ�λ�õ����꣨���꣨�ף���

	local POS_X=2168
	local POS_Y=2803
	return POS_X , POS_Y
end


function init_entry(map)
    SetMapEntryMapName(map, "garner")					-- ������ڵ�λ�ã���ͼ����
    SetMapEntryTime(map, "2011/3/29/0/0", "0/0/0", "0/0/0", "0/0/0")	-- The first set of numbers is the starting point (Year/Month/Day/Hour/Minute), next is opening interval (Day/Hour/Minute), portal open duration (Day/Hour/Minute), and last is the map duration (Day/Hour/Minute)

end
