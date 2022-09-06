-- env.info("Tanker respawn script started.")

-- local groupName = 'Texaco 1-1' -- Name of the group in the ME
-- local lowFuelThreshold = 0.08 -- RTB when less then this amount of fuel
-- local lowHealthThreshold = 0.75 -- RTB when less then this amount of health
-- barons_respawn_script.checkstate(groupName, lowFuelThreshold, lowHealthThreshold, true)

-- local groupName = 'Arco 1-1' -- Name of the group in the ME
-- local lowFuelThreshold = 0.08 -- RTB when less then this amount of fuel
-- local lowHealthThreshold = 0.75 -- RTB when less then this amount of health
-- barons_respawn_script.checkstate(groupName, lowFuelThreshold, lowHealthThreshold, true)

-- local groupName = 'Magic' -- Name of the group in the ME
-- local lowFuelThreshold = 0.08 -- RTB when less then this amount of fuel
-- local lowHealthThreshold = 0.75 -- RTB when less then this amount of health
-- barons_respawn_script.checkstate(groupName, lowFuelThreshold, lowHealthThreshold, true)

-- env.info("Tanker respawn script finished.")



  -- Declare SPAWN objects
  Arco11 = SPAWN:New("Arco 1-1"):InitLimit( 1, 99 )
  Arco11:InitRepeatOnLanding()
  Arco11:InitDelayOff()
  Arco11:InitRepeatOnEngineShutDown()
  Arco11:SpawnScheduled(180,0)

  Texaco11 = SPAWN:New("Texaco 1-1"):InitLimit( 1, 99 )
  Texaco11:InitRepeatOnLanding()
  Texaco11:InitDelayOff()
  Texaco11:InitRepeatOnEngineShutDown()
  Texaco11:SpawnScheduled(180,0)

  Magic = SPAWN:New("Magic"):InitLimit( 1, 99 )
  Magic:InitRepeatOnLanding()
  Magic:InitDelayOff()
  Magic:InitRepeatOnEngineShutDown()
  Magic:SpawnScheduled(180,0)
