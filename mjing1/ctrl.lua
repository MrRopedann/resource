--scripted by skyfear919@hotmail.com

function config(map)
    MapCanSavePos(map, 1) --���+�+=-����-�+�-���+��+��+=-��+�-���-������+T���+L-���+�+=-�-T�L��---
    MapCanPK(map, 1) --���+�+=-������TLPK��+T���+L-���+�+=-�-T�L��---
    MapCopyNum(map, 1) --���+�+=-�-�---��-���L��v-���L+�+L�-���L���L+-�L��1
    SingleMapCopyPlyNum(map, 300)
    MapCanTeam(map , 1)
    MapType ( map , 4 )

end


function init_entry(map)
    SetMapEntryMapName(map, "winterland") --Set up the entrance location (map name)
    SetMapEntryTime(map, "2006/10/18/14/0", "0/1/0", "0/1/0", "0/1/0") --Entrance time, the map object, the first open time (year / month / day / time / min), after re-opening of the inter - Every (day / hours / minutes, all 0 means that only the first time to open), open to the entrance to disappear each time interval (days / hours / minutes, 0 that will never wholly disappear), the map of the closure of each open interval (days / hours / minutes that never shut down the entire 0).

end
