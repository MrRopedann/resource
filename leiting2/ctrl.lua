--іЋќƒЉю÷–£ђЈ≤ «њ…ƒ№±їґаіќ÷і––µƒЇѓ э£ђЇѓ э√ыґЉ“™Љ”…ѕµЎЌЉ√ы«∞„Ї

function config(map)
    MapCanSavePos(map, 0) --…и÷√µЎЌЉ «Јс±£іжљ«…Ђќї÷√£®µЎЌЉ£ђ„ш±к£ђЈљѕт£©£ђіЋ…и÷√”∞ѕмЄ√µЎЌЉµƒЋщ”–Є±±Њ
    MapCanPK(map, 1) --…и÷√µЎЌЉ «Јсњ…“‘PK£ђіЋ…и÷√”∞ѕмЄ√µЎЌЉµƒЋщ”–Є±±Њ
    MapCopyNum(map, 1) --…и÷√µЎЌЉµƒЄ±±Њ эƒњ£ђ»зєы≤їµч”√Є√”пЊд£ђ‘т є”√ƒђ»ѕ÷µ1
    SingleMapCopyPlyNum(map, 300)   --…и÷√“їЄцЄ±±ЊµƒЌжЉ“ э
	MapCanTeam(map , 1)
    MapType ( map , 4 )
end


function get_map_entry_pos_leiting2()   --ћесто открыти€ портала

	local POS_X=2213
	local POS_Y=2750
	return POS_X , POS_Y

end

function init_entry(map)
    SetMapEntryMapName(map, "garner") --–егион по€влени€ портала в ћираж Ћедыни
    SetMapEntryTime(map, "2010/10/18/0/0", "0/4/0", "0/0/60", "0/2/0") --¬рем€ по€влени€ портала в ћираж Ћедыни

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