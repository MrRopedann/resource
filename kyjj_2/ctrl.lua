--------------------------------------------------------------------------
--									--
--									--
--				ctrl.lua				--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading kyjj_2 Ctrl.lua" )

function config(map)
    MapCanSavePos(map, 0) --���õ�ͼ�Ƿ񱣴��ɫλ�ã���ͼ�����꣬���򣩣�������Ӱ��õ�ͼ�����и���
    MapCanPK(map, 1) --���õ�ͼ�Ƿ����PK��������Ӱ��õ�ͼ�����и���
    MapCopyNum(map, 1) --���õ�ͼ�ĸ�����Ŀ����������ø���䣬��ʹ��Ĭ��ֵ1
    SingleMapCopyPlyNum(map, 300)   --����һ�������������
	MapCanTeam(map , 1)
    MapType ( map , 4 )
end


function get_map_entry_pos_kyjj_2()   --������ڵ�λ�õ����꣨���꣨�ף���

end

function init_entry(map)
   
end

function after_enter_kyjj_2( role , map_copy )

local cha_name=GetChaDefaultName(role)

end

function before_leave_kyjj_2 ( role )

end

function map_copy_first_run_kyjj_2( map_copy )



end

function map_copy_run_kyjj_2( map_copy )



end

--ÿ5��ִ��һ�ε�
function map_run_kyjj_2( map )


end

--��ͼ�ر�ʱִ��
function map_copy_close_kyjj_2 ( map_copy )

end
		
--��ͼ�����жϡ�����������������������������������������������������������������������������������

function can_open_entry_kyjj_2( map ) 

end 