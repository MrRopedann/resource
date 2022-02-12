print("* Loading CheckForge")
	-- ******************************************************************************************************************************************************************************* --
	-- **************************************************************************** Equipment Forge Check **************************************************************************** --
	-- ***************************************************************************** Scripted by Angelix ***************************************************************************** --
	-- ******************************************************************************************************************************************************************************* --
	-- ********************************************************************** Installation & Usage Instructions ********************************************************************** --
	-- ******************************************************************************************************************************************************************************* --
	--	Installation:
	--	1.	Load this file using 'dofile' function.
	--	Usage:
	--	1.	Get your equipment number from the 'Look.lua' file within 'resource/script/calculate' folder.
	--	2.	If you want a player to have an equipment (like boots) with forge level below or at 9, then use 'EquipForgeCheck(Player, enumEQUIP_SHOES, '<=', 9)'.
	--	--	If the condition is met, it will return 'true', otherwise 'false'.
	-- ******************************************************************************************************************************************************************************* --
	-- ******************************************************************************************************************************************************************************* --
EquipForgeCheck = function(Player, EquipSlot, Type, Amount)
	if type(Player) ~= 'userdata' or type(EquipSlot) ~= 'number' or type(Type) ~= 'string' or type(Amount) ~= 'number' then
		LG('EquipForgeCheck', 'Parameters are not correct.')
		return false
	end
	local Equipment = GetChaItem(Player, 1, EquipSlot)
	local Forge = TansferNum(GetItemForgeParam(Equipment, 1))
	
	local ForgeLevel = GetNum_Part3(Forge) + GetNum_Part5(Forge) + GetNum_Part7(Forge)
	
	if Type == '<' and ForgeLevel < Amount then
		return true
	elseif Type == '<=' and ForgeLevel <= Amount then
		return true
	elseif Type == '>' and ForgeLevel > Amount then
		return true
	elseif Type == '>=' and ForgeLevel >= Amount then
		return true
	elseif Type == '=' and ForgeLevel == Amount then
		return true
	end
	return false
end