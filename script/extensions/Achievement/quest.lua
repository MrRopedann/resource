print("* Loading <Achievement> quest.lua" )

function AchievementQuest()
	-----------------------------------------------
	DefineMission( 209, "Lv1 Combine Mastery", 163)
	-----------------------------------------------
	MisBeginTalk( "" )
	MisBeginCondition(HasItem, 3289,1)
	MisBeginCondition(NoMission,163)
	MisBeginCondition(NoRecord,163)
	MisBeginAction(AddMission, 163)

	MisCancelAction(ClearMission, 163)
	MisNeed(MIS_NEED_DESP, "<n><yCombine Lv1 Gem to obtain Lv2 Gem 100 Times.> <n>")

	MisHelpTalk("")
	MisResultTalk("<t>Achievement Completed!<n>")

	MisResultCondition(AchievementIsCombineComplete, 1)
	MisResultCondition(HasItem, 3289,1)
	MisResultCondition(HasMission, 163)
	MisResultAction(ClearMission, 163)
	MisResultAction(SetRecord, 163)
	-----------------------------------------------


	-----------------------------------------------
	DefineMission( 210, "Lv2 Combine Mastery", 164)
	-----------------------------------------------
	MisBeginTalk( "" )
	MisBeginCondition(HasItem, 3289,1)
	MisBeginCondition(HasRecord,163)
	MisBeginCondition(NoMission,164)
	MisBeginCondition(NoRecord,164)
	MisBeginAction(AddMission, 164)

	MisCancelAction(ClearMission, 164)
	MisNeed(MIS_NEED_DESP, "<n><yCombine Lv2 Gem to obtain Lv3 Gem 100 Times.> <n>")

	MisHelpTalk("")
	MisResultTalk("<t>Achievement Completed!<n>")

	MisResultCondition(AchievementIsCombineComplete, 2)
	MisResultCondition(HasItem, 3289,1)
	MisResultCondition(HasMission, 164)
	MisResultAction(ClearMission, 164)
	MisResultAction(SetRecord, 164)


	-----------------------------------------------
	DefineMission( 211, "Lv3 Combine Mastery", 165)
	-----------------------------------------------
	MisBeginTalk( "" )
	MisBeginCondition(HasItem, 3289,1)
	MisBeginCondition(HasRecord,164)
	MisBeginCondition(NoMission,165)
	MisBeginCondition(NoRecord,165)
	MisBeginAction(AddMission, 165)

	MisCancelAction(ClearMission, 165)
	MisNeed(MIS_NEED_DESP, "<n><yCombine Lv3 Gem to obtain Lv4 Gem 100 Times.> <n>")

	MisHelpTalk("")
	MisResultTalk("<t>Achievement Completed!<n>")

	MisResultCondition(AchievementIsCombineComplete, 3)
	MisResultCondition(HasItem, 3289,1)
	MisResultCondition(HasMission, 165)
	MisResultAction(ClearMission, 165)
	MisResultAction(SetRecord, 165)


	-----------------------------------------------
	DefineMission( 212, "Lv4 Combine Mastery", 166)
	-----------------------------------------------
	MisBeginTalk( "" )
	MisBeginCondition(HasItem, 3289,1)
	MisBeginCondition(HasRecord,165)
	MisBeginCondition(NoMission,166)
	MisBeginCondition(NoRecord,166)
	MisBeginAction(AddMission, 166)

	MisCancelAction(ClearMission, 166)
	MisNeed(MIS_NEED_DESP, "<n><yCombine Lv4 Gem to obtain Lv5 Gem 100 Times.> <n>")

	MisHelpTalk("")
	MisResultTalk("<t>Achievement Completed!<n>")

	MisResultCondition(AchievementIsCombineComplete, 4)
	MisResultCondition(HasItem, 3289,1)
	MisResultCondition(HasMission, 166)
	MisResultAction(ClearMission, 166)
	MisResultAction(SetRecord, 166)


	-----------------------------------------------
	DefineMission( 213, "Lv5 Combine Mastery", 167)
	-----------------------------------------------
	MisBeginTalk( "" )
	MisBeginCondition(HasItem, 3289,1)
	MisBeginCondition(HasRecord,166)
	MisBeginCondition(NoMission,167)
	MisBeginCondition(NoRecord,167)
	MisBeginAction(AddMission, 167)

	MisCancelAction(ClearMission, 167)
	MisNeed(MIS_NEED_DESP, "<n><yCombine Lv5 Gem to obtain Lv6 Gem 100 Times.> <n>")

	MisHelpTalk("")
	MisResultTalk("<t>Achievement Completed!<n>")

	MisResultCondition(AchievementIsCombineComplete, 5)
	MisResultCondition(HasItem, 3289,1)
	MisResultCondition(HasMission, 167)
	MisResultAction(ClearMission, 167)
	MisResultAction(SetRecord, 167)
end
AchievementQuest()