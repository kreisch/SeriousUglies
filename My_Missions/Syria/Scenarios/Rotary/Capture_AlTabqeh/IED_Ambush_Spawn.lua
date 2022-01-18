IED_Ambush = SPAWN:New( "RU_Ambush1-1_Inf" )
  :InitLimit(45,5)
  :InitRandomizePosition(true,20,20)
  :SpawnScheduled(5,.5)
  
IED_US_Troops = SPAWN:New("US_Widow_Deploy_Inf-1"):Spawn()