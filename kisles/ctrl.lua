--------------------------------------------------------------------------
--									--
--									--
--				ctrl.lua				--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading kisles Ctrl.lua" )


--���ļ��У����ǿ��ܱ����ִ�еĺ�������������Ҫ���ϵ�ͼ��ǰ׺

function config(map)
   
	MapCanSavePos(map, 1) --�ԧ��+?+=-??����-��+��-?�ԧ�+����+�ԧ�?+=-�ԧ�+?-��ԧާ�-?�קԧۧԧ�+T�ԧ��+L-?�+?+=-?-T?L?��---
    MapCanPK(map, 1) --�ԧ��+?+=-??��������TLPK�ԧ�+T�ԧ��+L-?�+?+=-?-T?L?��---
    MapCopyNum(map, 1) --�ԧ��+?+=-?-��---?��-���ԧ�L��?v-��?��L+��+L��-��ԧ�L��??L+-��L?��?1
    SingleMapCopyPlyNum(map, 300)
    MapCanTeam(map , 1)
    MapType ( map , 3 )
	
end


function get_map_entry_pos_kisles()   --������ڵ�λ�õ����꣨���꣨�ף���

end

function init_entry(map)

end

function after_enter_kisles( role , map_copy )
end

function before_leave_kisles( role )
end

function map_copy_first_run_kisles( map_copy )

end

function map_copy_run_kisles( map_copy )
end

--ÿ5��ִ��һ�ε�
function map_run_kisles( map )
end

--��ͼ�ر�ʱִ��
function map_copy_close_kisles ( map_copy )
end
		
--��ͼ�����жϡ�����������������������������������������������������������������������������������

function can_open_entry_kisles( map ) 
end 