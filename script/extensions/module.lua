print("Loading module.lua");

-- Required Functions
if(file_exists == nil)then
        function file_exists(name)
           local f=io.open(name,"r")
           if f~=nil then io.close(f) return true else return false end
        end
end
 
-- Load Required Files
if(table.save == nil)then
        --dofile(GetResPath("script/serialize.lua"))
	
end
 
 
Module = {}                     -- Variable Storing all information about the System
Module.List = {}                -- List containing all loaded Modules
Module.Enable = true            -- false for disabling the Modules
Module.Root = GetResPath("script/modules/")
Module.Disable = {}
 
-- List of Modules Which shall not be loaded:
Module.Disable["Hook"] = false -- ture for disable / false for enable
 
if(file_exists(Module.Root.."modules.dat")) then
        Module.List = table.load(Module.Root.."modules.dat")
else
        Module.List = {}
end
 
-- Load Module by Name
function Module:Load(name)
        if(Module.List[name] ~= nil)then
                if(Module.Disable[name] == false or Module.Disable[name] == nil)then
                        if(file_exists(Module.Root..name.."/init.lua") ~= false)then
                                dofile(Module.Root..name.."/init.lua")
                        else
                                print("The installed Module ["..name.."] does not exsits!")
                        end
                else
                        print("The Module ["..name.."] is disabled")
                end
        else
                print("Can not find Module ["..name.."] make sure it is installed proper")
        end
end
 
function Module:LoadAll()
        for i,v in pairs(Module.List) do
                Module:Load(i)
        end
end
 
function Module:Update()
        if(file_exists(Module.Root.."install.lua") ~= false)then
                local name = dofile(Module.Root.."install.lua")
                table.save(Module.List,Module.Root.."modules.dat")
                if(Module.List[name] ~= nil)then
                        os.remove(Module.Root.."install.lua")
                end
        end
end
 
function Module:Init()
        Module:Update()
        Module:LoadAll()
end
 
Module:Init()
