--------------------------------------------------------------------------
--									--
--									--
--				ctrl.lua				--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading farmer1 Ctrl.lua" )


--���ļ��У����ǿ��ܱ����ִ�еĺ�������������Ҫ���ϵ�ͼ��ǰ׺

function config(map)
     MapCanSavePos(map, 1) 
    MapCanPK(map, 1) 
    MapCopyNum(map, 1) 
    SingleMapCopyPlyNum(map, 300)   
    MapCanTeam(map , 1)
    MapType ( map , 3 )
end


function get_map_entry_pos_farmer1()   --������ڵ�λ�õ����꣨���꣨�ף���

end

function init_entry(map)

end

function after_enter_farmer1( role , map_copy )
end

function before_leave_farmer1( role )
end

function map_copy_first_run_farmer1( map_copy )

end

function map_copy_run_farmer1( map_copy )
end

--ÿ5��ִ��һ�ε�
function map_run_farmer1( map )
end

--��ͼ�ر�ʱִ��
function map_copy_close_farmer1 ( map_copy )
end
		
--��ͼ�����жϡ�����������������������������������������������������������������������������������

function can_open_entry_farmer1( map ) 
end 