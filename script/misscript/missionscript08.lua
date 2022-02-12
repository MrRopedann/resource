--------------------------------------------------------------------------
--									--
--									--
--		NPCScript08.lua Created by knight.gong 2005.7.12.	--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading MissionScript08.lua" )

--Тюрьма
    DefineMission ( 6230, "\207\243\242\252 \206\241\226\238\225\238\230\228\229\237\232\255", 1280 )
   
    MisBeginTalk ( "<t>\205\229\231\224\226\232\241\232\236\238 \238\242 \242\238\227\238,\239\238\247\229\236\243 \226\251 \239\238\239\224\235\232 \241\254\228\224, \226\251 \228\238\235\230\237\251 \241\238\225\235\254\228\224\242\252 \231\228\229\248\237\232\229 \239\240\224\226\232\235\224. \197\241\235\232 \226\251 \245\238\242\232\242\229 \243\231\237\224\242\252 \234\224\234 \238\242\241\254\228\224 \236\238\230\237\238 \226\251\225\240\224\242\252\241\255 \241\239\240\238\241\232\242\229 \207\238\236\238\248\237\232\234\224 \205\224\228\231\232\240\224\242\229\235\255 ")
    MisBeginCondition( NoMission, 1280)
    MisBeginCondition( NoRecord, 1280)
    MisBeginAction( AddMission, 1280)
    MisCancelAction( ClearMission, 1280)
 
    MisNeed( MIS_NEED_DESP, "\209\239\240\238\241\232\242\229 \207\238\236\238\248\237\232\234\224 \205\224\228\231\232\240\224\242\229\235\255 \234\224\234 \236\238\230\237\238 \239\238\234\232\237\243\242\252 \253\242\238 \236\229\241\242\238 ")
 
    MisHelpTalk( "\196\229\233\241\242\226\243\233\242\229!")
    MisResultCondition ( AlwaysFailure )
 
 
    DefineMission ( 6231, "\207\243\242\252 \238\241\226\238\225\238\230\228\229\237\232\255", 1280, COMPLETE_SHOW )
 
    MisBeginCondition ( AlwaysFailure )
 
    MisResultTalk ( "<t>\205\229\242\229\240\239\232\242\229 \239\238\234\232\237\243\242\252 \242\254\240\252\236\243? \223 \237\229 \228\243\236\224\254 \247\242\238 \231\228\229\241\252 \237\224\241\242\238\235\252\234\238 \241\234\243\247\237\238, \245\224-\245\224. \197\241\235\232 \194\251 \228\229\233\241\242\226\232\242\229\235\252\237\238 \245\238\242\232\242\229 \239\238\234\232\237\243\242\252 \253\242\238 \236\229\241\242\238, \242\238 \241\235\243\248\224\233\242\229\241\252 \236\229\237\255.")
    MisResultCondition( HasMission, 1280)
    MisResultCondition( NoRecord, 1280)
    MisResultAction( ClearMission, 1280)
    MisResultAction( SetRecord, 1280)
	
	
	
	DefineMission( 6138, "\221\234\231\224\236\229\237", 1211 )
	MisBeginTalk( "<t>\194 \236\238\184\236 \231\224\228\224\237\232\232 \237\229\242 \237\232 \247\229\227\238 \241\235\238\230\237\238\227\238: \207\240\232\237\229\241\232 10 \241\243\237\228\243\234\238\226 \241 \240\243\237\224\236\232 \202\253\235\252 (1000 \248\242\243\234) \232 \226\241\184." )
	MisBeginCondition( CheckXSZCh,2 )				------
	MisBeginCondition( HasItem , 3280,1 )
	MisBeginCondition( HasNoItem, 3282)
	MisBeginCondition( NoMission ,1211)
	MisBeginAction( AddMission, 1211)
	MisBeginAction(AddTrigger, 12111, TE_GETITEM, 7746, 10 )--
	MisCancelAction( ClearMission, 1211)

	MisNeed(MIS_NEED_ITEM, 7746, 10, 10, 10 )
	MisHelpTalk( "<t>\223 \237\229 \225\243\228\243 \240\224\231\227\238\226\224\240\232\226\224\242\252 \228\238 \242\229\245 \239\238\240 \239\238\234\224 \237\229 \243\226\232\230\243 10 \241\243\237\228\243\234\238\226 \241 \240\243\237\224\236\232 \202\253\235\252 (1000 \248\242\243\234)" )

	MisResultTalk( "<t>\216\234\238\235\252\237\224\255 \239\240\238\227\240\224\236\236\224 \238\247\229\237\252 \226\224\230\237\224 " )
	MisResultCondition( HasMission, 1211)
	MisResultCondition( HasItem, 7746, 10)
	MisResultAction( TakeItem, 7746, 10)
	MisResultAction( ClearMission, 1211)
	MisResultAction( GiveItem, 3282, 1, 4)--листок с ответами на экзамен

	InitTrigger()
	TriggerCondition( 1, IsItem, 7746)	
	TriggerAction( 1, AddNextFlag, 1211, 10, 10 )
	RegCurTrigger( 12111 )
