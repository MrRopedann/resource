function config(map)
    MapCanSavePos(map, 1)
    MapCanPK(map, 0)
  --MapCopyNum(map, 1)
  --SingleMapCopyPlyNum(map, 300)
  --MapCanTeam(map , 1) 
  --MapType ( map , 4 )

end

function init_entry(map)

end

function map_run_winterland ( map )
	local now_hour= tonumber(os.date("%H"))
	local now_miniute= tonumber(os.date("%M"))   
	local CheckDateNum = now_hour*100 +now_miniute
	local NowSecond = tonumber(os.date("%S"))
	if now_hour == 0  and now_miniute == 0 and  NowSecond < 6 then
		Clear_Event_Record_By_Event_Name( "????ָ?ӵľۻ?" )
		Clear_Event_Record_By_Event_Name( "????Σ??" )
		Clear_Event_Record_By_Event_Name( "ά??????????" )
		Clear_Event_Record_By_Event_Name( "????????????" )
		Clear_Event_Record_By_Event_Name( "?????鱨Ա" )
	end
end