env.info("Carrier: Loading configuration for Recovery Tanker")

-- S-3B Recovery Tanker spawning in air. Groupname
local tanker2=RECOVERYTANKER:New("USS George Washington", "RecoveryTanker")
--tanker:SetTakeoffAir()
tanker2:SetRadio(121)
tanker2:SetModex(912)
tanker2:SetTACAN(21, "SHL11")
tanker2:SetTakeoffCold()
tanker2:SetAltitude(6000)
tanker2:SetSpeed(300)
tanker2:Start()

-- Rescue Helo with home base Lake Erie. Has to be a global object! Group name for helo
rescuehelo2=RESCUEHELO:New("USS Rafael Peralta", "RescueHelo")
rescuehelo2:SetHomeBase(AIRBASE:FindByName("USS Rafael Peralta"))
rescuehelo2:SetModex(41)
rescuehelo2:SetTakeoffAir()
rescuehelo2:__Start(1)


env.info("Carrier: Loaded configuration for Tanker")