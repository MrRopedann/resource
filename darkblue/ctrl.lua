--------------------------------------------------------------------------
--									--
--									--
--				ctrl.lua				--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading Darkblue Ctrl.lua" )


--���ļ��У����ǿ��ܱ����ִ�еĺ�������������Ҫ���ϵ�ͼ��ǰ׺

function config(map)
    MapCanSavePos(map, 1) --�ԧ��+|+=-||?��-��+��-|�ԧ�+?��+�ԧ�|+=-�ԧ�+��-��ԧ�?-|?�ԧۧԧ�+T�ԧ��+L-|��?+|+=-|-T?L|?---
    MapCanPK(map, 1) --�ԧ��+|+=-||?��?��TLPK�ԧ�+T�ԧ��+L-|��?+|+=-|-T?L|?---
    MapCopyNum(map, 1) --�ԧ��+|+=-|-?---|��-?�ԧ�L��|v-?|?L+?+L��-��ԧ�L?||L+-��L|��|1
    SingleMapCopyPlyNum(map, 300)
    MapCanTeam(map , 1)
    MapType ( map , 4 )

end

function get_map_entry_pos_darkblue()   --������ڵ�λ�õ����꣨���꣨�ף���

end

function init_entry(map)

end

function after_enter_darkblue( role , map_copy )
end

function before_leave_darkblue( role )
end

function map_copy_first_run_darkblue( map_copy )

end

function map_copy_run_darkblue( map_copy )
end

--ÿ5��ִ��һ�ε�
function map_run_darkblue( map )
end

--��ͼ�ر�ʱִ��
function map_copy_close_darkblue ( map_copy )
end
		
--��ͼ�����жϡ�����������������������������������������������������������������������������������

function can_open_entry_darkblue( map ) 
end 