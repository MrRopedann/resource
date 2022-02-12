DataFile = {
	file = "",
	tab = {},
}

function DataFile:Init(file,tab)
	local object = {file = file,tab = tab or {}}
	setmetatable(object, self)
	self.__index = self
	return object
end

function DataFile:Load()
	local Table = io.open(self.file,'a')
	io.close(Table) 
	local ret = dofile(self.file)    
	if ret == "" or ret == nil then
		ret = {}
	end
	
	return ret
end

function DataFile:Save()
	local ret = 'return '..self:TableToText()
	local Table = io.open(self.file,'w+')
	Table:write(ret)

	io.close(Table) 
end

function DataFile:TableToText(tab)
	local str = '{'
	local count = 0
	for i,v in pairs(tab or self:GetTable()) do
		local val = self:AddQuotes(v)
		if type(v) == 'table' then
			val = self:TableToText(v)
		end
		str = string.format('%s[%s]=%s,',str,self:AddQuotes(i),val)
	end
	str = str..'}'
	return str
end

-- Convert a lua table into a lua syntactically correct string
function DataFile:TableToString(tbl)
    local result = "{"
	
    for k, v in pairs(tbl) do
        if type(k) == "string" then
            result = result.."[\""..k.."\"]="
		else
			result = result.."["..tostring(k).."]="
        end

        if type(v) == "table" then
            result = result..self:TableToString(v)
        elseif type(v) == "string" then
            result = result.."\""..tostring(v).."\""
        else
			result = result..tostring(v)
        end
        result = result..","
    end
	
    if result ~= "" then
		if string.len(result) > 1 then
			result = string.sub(result, 1, string.len(result)-1)
		end
    end
    return result.."}"
end

function DataFile:TableToText(tabNew)
	local tab = tabNew or self:GetTable()
    local str = self:TableToString(tab)
	return str
end

function DataFile:AddQuotes(value)
	if type(value) == 'string' then
		value = "'"..value.."'"
	elseif type(value) == 'boolean' then
		if value then
			value = 'true'
		else
			value = 'false'
		end
	end
	return value
end

function DataFile:GetTable()
	if type(self.tab) == "string" then
		return _G[self.tab]
	elseif type(self.tab) == "table" then
		return self.tab
	end
end