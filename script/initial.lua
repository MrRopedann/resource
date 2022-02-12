dofile(GetResPath("script/datafile.lua"))
print("-------------------------------")
print("-    Registering DataFile     -")

file_exists = file_exists or function(name)
	local f = io.open(name,"r")
	if f ~= nil then
		io.close(f)
		return true
	else
		return false
	end
end
print("-    Registering file_exist   -")

AdjustTextSpace = AdjustTextSpace or function(Text, Spaces, End)
	local Count = math.floor((Spaces - string.len(Text)) * 0.5)
	local Message = ""
	for C = 1, Count, 1 do
		Message = Message.." "
	end
	Message = Message..Text
	Count = math.floor(Spaces - string.len(Message))
	for C = 1, Count, 1 do
		Message = Message.." "
	end
	if End ~= nil then
		Message = Message..End
	end
	return Message
end	
do	
	split 					= function(str, delim, maxNb)
		if string.find(str, delim) == nil then
			return { str }
		end
		if maxNb == nil or maxNb < 1 then
			maxNb			= 0
		end
		local result			= {}
		local pat 			= "(.-)" .. delim .. "()"
		local nb 			= 0
		local lastPos
		for part, pos in string.gfind(str, pat) do
			nb 				= nb + 1
			result[nb] 		= part
			lastPos 		= pos
			if nb == maxNb then
				break
			end
		end
		if nb ~= maxNb then
			result[nb + 1]	= string.sub(str, lastPos)
		end
		return result
	end
	print("- Loading PKO Function - split created -")	
end

print("- Registering AdjustTextSpace -")		
print("-------------------------------")		