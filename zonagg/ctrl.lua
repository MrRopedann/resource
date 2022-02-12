--------------------------------------------------------------------------
--									--
--									--
--				ctrl.lua				--
--			made by Prince				--
--									--
--------------------------------------------------------------------------
print( "Loading zonagg Ctrl.lua" )

function config(map)
    MapCanSavePos(map, 1) --ãøã+¦+=-¦¦¬¸-ã+ö-¦ãë+¬ã+ãè¦+=-ãì+°-úãì¬-¦ªãéãì+Tãøã+L-¦ü¬+¦+=-¦-T•L¦¬---
    MapCanPK(map, 1) --ãøã+¦+=-¦¦¬¸¬ãTLPKãì+Tãøã+L-¦ü¬+¦+=-¦-T•L¦¬---
    MapCopyNum(map, 1) --ãøã+¦+=-¦-¬---¦¤-¬ãìL÷¦v-¬¦¢L+¬+Lÿ-ôãìLª¦¦L+-ìL¦ã¦1
    SingleMapCopyPlyNum(map, 300)
    MapCanTeam(map , 1)
    MapType ( map , 4 )

end

function init_entry(map)

    SetMapEntryMapName(map, "garner") 
    SetMapEntryTime(map, "2006/10/18/12/30", "0/24/0", "0/24/0", "0/24/0")

end

