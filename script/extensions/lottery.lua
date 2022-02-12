-- Lottery System V(1.0) - Xeon
print("Loading lottery.lua");

FILE_READ = 'r'
FILE_WRITE = 'w'

LotterySystem = { }

LotterySystem.Database = GetResPath("script/extension/LotterySystem/Lottery.dat")

LotterySystem.Rewards = {
						Items = {
									{ ItemID = 7625, Qua = 2, Param = 4 }, -- 10 репы
									{ ItemID = 7622, Qua = 1, Param = 4 }, -- 50 репы
									{ ItemID = 7623, Qua = 1, Param = 4 }, -- 100 репы
									{ ItemID = 7624, Qua = 1, Param = 4 }, -- 500 репы	
									{ ItemID = 7483, Qua = 1, Param = 4 }, -- +7
									{ ItemID = 7510, Qua = 1, Param = 4 }, -- +14
									{ ItemID = 7620, Qua = 1, Param = 4 }, -- +20
									{ ItemID = 7705, Qua = 1, Param = 4 }, -- Улучшение Плаща
									{ ItemID = 7706, Qua = 1, Param = 4 }, -- Улучшение Плаща
									{ ItemID = 7707, Qua = 1, Param = 4 }, -- Улучшение Плаща
									{ ItemID = 7708, Qua = 1, Param = 4 }, -- Улучшение Плаща
									{ ItemID = 7709, Qua = 1, Param = 4 }, -- Улучшение Плаща
									{ ItemID = 7710, Qua = 1, Param = 4 }, -- Улучшение Плаща
									{ ItemID = 7711, Qua = 1, Param = 4 }, -- Улучшение Плаща
									{ ItemID = 7712, Qua = 1, Param = 4 }, -- Улучшение Плаща
									{ ItemID = 7713, Qua = 1, Param = 4 }, -- Улучшение Плаща
									{ ItemID = 7714, Qua = 1, Param = 4 }, -- Улучшение Плаща
									{ ItemID = 7715, Qua = 1, Param = 4 }, -- Улучшение Плаща
									{ ItemID = 7716, Qua = 1, Param = 4 }, -- Улучшение Плаща
									{ ItemID = 7717, Qua = 1, Param = 4 }, --Улучшение Плаща
									{ ItemID = 7718, Qua = 1, Param = 4 }, -- Улучшение Плаща
									{ ItemID = 7719, Qua = 1, Param = 4 }, -- Улучшение Плаща
									{ ItemID = 7720, Qua = 1, Param = 4 }, -- Улучшение Плаща
									{ ItemID = 7476, Qua = 1, Param = 4 }, -- 10к
									{ ItemID = 7491, Qua = 1, Param = 4 }, -- 50к
									{ ItemID = 7492, Qua = 1, Param = 4 }, -- 100к
									{ ItemID = 7493, Qua = 1, Param = 4 }, -- 500к
									{ ItemID = 854, Qua = 1, Param = 4 }, -- 1кк
									{ ItemID = 7734, Qua = 1, Param = 4 }, -- 5кк
									{ ItemID = 7735, Qua = 1, Param = 4 }, -- 50кк
									{ ItemID = 7528, Qua = 1, Param = 4 }, -- часть плаща
									{ ItemID = 7528, Qua = 2, Param = 4 }, -- часть плаща х2
									{ ItemID = 7528, Qua = 3, Param = 4 }, -- часть плаща х3
									{ ItemID = 7484, Qua = 1, Param = 4 }, -- свиток удачи
									{ ItemID = 7502, Qua = 1, Param = 4 }, -- великий свиток удачи
									{ ItemID = 7503, Qua = 1, Param = 4 }, -- мифический свиток удачи
									{ ItemID = 7489, Qua = 1, Param = 4 }, -- коробка с аурами
									{ ItemID = 7482, Qua = 1, Param = 4 }, -- улучшение экипировки
									{ ItemID = 7482, Qua = 2, Param = 4 }, -- улучшение экипировки х2
									{ ItemID = 7482, Qua = 3, Param = 4 }, -- улучшение экипировки х3
									{ ItemID = 7477, Qua = 1, Param = 4 }, -- свиток атаки
									{ ItemID = 7478, Qua = 1, Param = 4 }, -- свиток защиты
									{ ItemID = 7479, Qua = 1, Param = 4 }, -- свиток сопротивления
									{ ItemID = 7480, Qua = 1, Param = 4 }, -- свиток уклонения
									{ ItemID = 7481, Qua = 1, Param = 4 }, -- свиток попадания
									{ ItemID = 7453, Qua = 1, Param = 4 }, -- свиток характеристик
									{ ItemID = 4603, Qua = 1, Param = 4 }, -- Билет до Шайтана
									{ ItemID = 7444, Qua = 1, Param = 4 }, -- Сундук Заточки
									{ ItemID = 7496, Qua = 1, Param = 4 }, -- мешок с великим фруктом фей
									{ ItemID = 7627, Qua = 1, Param = 4 }, -- мешок с легендарным фруктом фей
									{ ItemID = 7628, Qua = 1, Param = 4 }, -- мешок с мифическим фруктом фей
									{ ItemID = 3909, Qua = 1, Param = 4 }, -- Гъоза
									{ ItemID = 3909, Qua = 2, Param = 4 }, -- Гъоза х2
									{ ItemID = 3909, Qua = 3, Param = 4 }, -- Гъоза х3
									{ ItemID = 7450, Qua = 1, Param = 4 }, -- кэль 10 шт
									{ ItemID = 7467, Qua = 1, Param = 4 }, -- кэль 100 штук
									{ ItemID = 7746, Qua = 1, Param = 4 }, -- кэль 1000 штук
									{ ItemID = 7621, Qua = 1, Param = 4 }, -- сфера хаоса
									{ ItemID = 7626, Qua = 1, Param = 4 }, -- сфера арены
									{ ItemID = 5702, Qua = 1, Param = 4 }, -- Ключ Пурпурного Кристалла
									{ ItemID = 5703, Qua = 1, Param = 4 }, -- Ключ Зеленого Дракона
									{ ItemID = 5704, Qua = 1, Param = 4 }, -- Ключ Черного Дракона
									{ ItemID = 5705, Qua = 1, Param = 4 }, -- Ключ Предела
									{ ItemID = 5706, Qua = 1, Param = 4 }, -- Божественный Ключ
									{ ItemID = 5710, Qua = 1, Param = 4 }, -- Сундук Пурпурного Кристалла
									{ ItemID = 5711, Qua = 1, Param = 4 }, -- Сундук Зеленого Дракона
									{ ItemID = 5712, Qua = 1, Param = 4 }, -- Сундук Черного Дракона
									{ ItemID = 5713, Qua = 1, Param = 4 }, -- Сундук Предела
									{ ItemID = 5714, Qua = 1, Param = 4 }, -- Божественный Сундук
									{ ItemID = 3362, Qua = 10, Param = 4 }, -- черная жемчужина х10
									{ ItemID = 3362, Qua = 50, Param = 4 }, -- черная жемчужина х50
									{ ItemID = 3362, Qua = 100, Param = 4 }, -- черная жемчужина х100
									{ ItemID = 3362, Qua = 500, Param = 4 }, -- черная жемчужина х500
									{ ItemID = 7451, Qua = 1, Param = 4 }, -- свиток перефоржа
									{ ItemID = 7494, Qua = 1, Param = 4 }, -- расписка на нефрит
									{ ItemID = 1000, Qua = 1, Param = 4 }, -- Чертеж 1 уровня
									{ ItemID = 684, Qua = 1, Param = 4 }, -- свиток сокровищ
									{ ItemID = 684, Qua = 2, Param = 4 }, -- свиток сокровищ х2
									{ ItemID = 684, Qua = 3, Param = 4 }, -- свиток сокровищ х3
								},
					 }
					 
function LotterySystem:Init()
	if(file_exists(LotterySystem.Database) ~= true) then
		table.save({}, LotterySystem.Database, FILE_WRITE)
	end
LotterySystem:Init()
end


function HasReceivedTicket(r)
	local database = table.load(LotterySystem.Database, FILE_READ)
	local c = GetChaDefaultName(r)
	if(database[c] ~= nil) then
		if(database[c] == true) then
			return LUA_FALSE
		else
			return LUA_TRUE
		end
	else
		return LUA_TRUE
	end
end

function SaveLotteryTicket(r)
	local database = table.load(LotterySystem.Database, FILE_READ)
	local c = GetChaDefaultName(r)

	if(database[c] == nil) then
		database[c] = true
	end
	
	table.save(database, LotterySystem.Database, FILE_READ)
end

function UseLotteryTicket(r, i)
	local space = GetChaFreeBagGridNum(r)
	local n = math.random(1, table.getn(LotterySystem['Rewards'].Items))
	local c = GetChaDefaultName(r)

	if(space < 1) then
		BickerNotice(r, '\205\229\245\226\224\242\224\229\242 \241\226\238\225\238\228\237\238\227\238 \236\229\241\242\224 ')
		UseItemFailed(r)
		return
	end
	
	GiveItem(r, 0, LotterySystem['Rewards'].Items[n].ItemID, LotterySystem['Rewards'].Items[n].Qua, LotterySystem['Rewards'].Items[n].Param)
	BickerNotice(r, '\194\251 \239\238\235\243\247\232\235\232 '..LotterySystem['Rewards'].Items[n].Qua..' ['..GetItemName(LotterySystem['Rewards'].Items[n].ItemID)..']')

	local itemname = GetItemName(LotterySystem['Rewards'].Items[n].ItemID)
	
	--Notice("\200\227\240\238\234 ["..c.."] \200\241\239\238\235\252\231\238\226\224\235 \235\238\242\229\240\229\233\237\251\233 \225\232\235\229\242, \232 \239\238\235\243\247\232\235 ["..itemname.."]")
end

