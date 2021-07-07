-- S-3B Recovery Tanker spawning in air. Groupname
local tanker=RECOVERYTANKER:New("GeorgeWashington", "ShellCarrier")
tanker:SetRadio(121)
tanker:SetModex(911)
tanker:SetTACAN(21, "SHL11")
tanker:SetAltitude(6000)
tanker:SetSpeed(250)
tanker:SetPatternUpdateInterval(1)
tanker:SetTakeoffCold()
tanker:Start()


-- Rescue Helo with home base Lake Erie. Has to be a global object! Group name for helo
rescuehelo=RESCUEHELO:New("GeorgeWashington", "Rescue Helo")
rescuehelo:SetHomeBase(AIRBASE:FindByName("USS Gary"))
rescuehelo:SetModex(012)
rescuehelo:SetTakeoffCold()
rescuehelo:__Start(1)