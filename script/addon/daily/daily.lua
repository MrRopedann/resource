--------------------------
--- Piratia Online 		--
--- Graf		   		--
--- Moroz		   		--
--- 2021		   		--
--- Discord - Graf#4664 --
--------------------------
dataFilePath = GetResPath("script\\addon\\daily\\cache_deli\\")

ARR_DAILY = {
	[1] = {id = 7502, count = 1},	-- 11221	����� �������� (�� ����������)
	[2] = {id = 7720, count = 15},	-- 11220	��������� ����� (�� ����������)
	[3] = {id = 7720, count = 1},	-- 11222	���� � ������ ����� (�� ����������)
	[4] = {id = 7620, count = 10},	-- 11221	����� �������� (�� ����������)
	[5] = {id = 7734, count = 1},	-- 11220	��������� ����� (�� ����������)
	[6] = {id = 7825, count = 1},	-- 10681	��������������� ����� (�� ����������)
	[7] = {id = 7825, count = 1}	-- 11223	VIP ������ (�� ����������)
}

-- ����������� ������� ��������
function Trim(s)
	return (string.gsub(s, "^%s*(.-)%s*$", "%1"))
end

-- ����������� ���������� ������
function Explode(seperator, str)
	local pos, i, arr = 0, 0, {}
	for st, sp in function() return string.find(str, seperator, pos, true) end do
		table.insert(arr, Trim(string.sub(str, pos, st-1)))
		pos = sp + 1
		i = i + 1
	end
	table.insert(arr, i, Trim(string.sub(str, pos)))
	return arr
end

-- ����� ������ ��������� ����
function GetNextDayInUnix(Time)
	local timeFinishQuest = os.date("*t", Time)
	local hour = tonumber(timeFinishQuest.hour) * 3600
	local minute = tonumber(timeFinishQuest.min) * 60
	local second = tonumber(timeFinishQuest.sec)
	local MinusToZero = (hour + minute + second)
	local nextDayUnix = (Time + 86400) - MinusToZero
	return nextDayUnix
end

-- ������� ���� �� ���������
function CreateData(cha_id)
	local wFile = io.open(dataFilePath.."cha_"..cha_id..".dat","w")
	if (wFile ~= nil) then
		wFile:write("Unix Last Get: "..os.time().."\n")
		wFile:write("Now Day: 1")
		wFile:close()
	end
end

-- �������� ����� ������ �� �������������
function IsDataExist(cha_id)
  local file = io.open(dataFilePath.."cha_"..cha_id..".dat","r")
  if file~=nil then io.close(file) return true else return false end
end

-- ������ ������
function ReadData(cha_id)
	local retData = {}
	local rFile = io.open(dataFilePath.."cha_"..cha_id..".dat","r")
	if (rFile ~= nil) then
		for rLine in rFile:lines() do 
			local expStr = Explode(": ", rLine)
			retData[expStr[2]] = expStr[1]
		end
		rFile:close()
		return retData
	end
end

-- �������� ��� ���
function GetDayInfo(cha_id)
	local ret = 0
	local data = ReadData(cha_id)
	local nowUnix = os.time()
	local lastUnix = tonumber(data["Unix Last Get"])
	local nowDay = tonumber(data["Now Day"])
	local nextDay = GetNextDayInUnix(lastUnix)
	local nextDayEnd = nextDay + 86400
	if (nowUnix >= nextDay and nowUnix < nextDayEnd) then
		ret = 1
	else
		if (nowUnix >= nextDayEnd) then
			ret = 2
		end
	end
	if (ret > 0) then
		local wFile = io.open(dataFilePath.."cha_"..cha_id..".dat","w")
		if (wFile ~= nil) then
			wFile:write("Unix Last Get: "..os.time().."\n")
			if (ret == 2) then
				wFile:write("Now Day: 1")
				nowDay = 1
			else
				local nextDayVal = nowDay + 1
				if (nextDayVal > 7) then nextDayVal = 1  end
				nowDay = nextDayVal
				wFile:write("Now Day: "..nextDayVal)
			end
			wFile:close()
		end
	end
	return { dayType = ret, dayNumber = nowDay}
end

-- ������� �������� �������� �����
function SendPrizeForm(role, now_day)
	print("SendPrizeForm")
	local packet = GetPacket()
	WriteCmd(packet, 785)		-- ����� �������� �������� �����
	WriteByte(packet, now_day)	-- ������� ����
	for i = 1, 7, 1 do
		--SystemNotice(role, i)
		WriteWord(packet, ARR_DAILY[i].id)		-- ��
		WriteWord(packet, ARR_DAILY[i].count)	-- ���-��
		if (i < now_day) then 
			WriteByte(packet, 1) -- ������� �������
			print("packet = 1")
		else
			WriteByte(packet, 0) -- ������� �� �������
			print("packet = 0")
		end
	end
	SendPacket(role, packet)
end

function GiveDeilyGift(role, gift_daily)
	print("GiveDeilyGift")
	if GetChaFreeBagGridNum(role) < 1 then
		PopupNotice(role, "���������� ���� ����� �� ��������� �����! ")
		GiveItemX(role, 0, ARR_DAILY[gift_daily].id, ARR_DAILY[gift_daily].count, 4)
	else
		PopupNotice(role, "���������� ���� ����� � ������! ")
		GiveItem(role, 0, ARR_DAILY[gift_daily].id, ARR_DAILY[gift_daily].count, 4)
	end
	local packet = GetPacket()
	WriteCmd(packet, 786)			-- ����� ������� ����� � �������
	WriteByte(packet, gift_daily)	-- ������� ����
	SendPacket(role, packet)
end