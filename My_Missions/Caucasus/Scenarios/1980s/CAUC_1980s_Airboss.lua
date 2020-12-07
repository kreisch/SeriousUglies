env.info("AIRBOSS: Loading configuration")


-- S-3B Recovery Tanker spawning in air. Groupname
local tanker2=RECOVERYTANKER:New("CVN-72 Lincoln", "ShellCarrier Lincoln")
--tanker:SetTakeoffAir()
tanker2:SetRadio(121)
tanker2:SetModex(912)
tanker2:SetTACAN(21, "SHL11")
tanker2:SetTakeoffCold()
tanker2:Start()

---- E-2D AWACS spawning on Stennis.
local awacs2=RECOVERYTANKER:New("CVN-72 Lincoln", "E-2D Magic Lincoln")
awacs2:SetAWACS()
awacs2:SetRadio(251)
awacs2:SetAltitude(20000)
awacs2:SetCallsign(CALLSIGN.AWACS.Magic)
awacs2:SetRacetrackDistances(30, 15)
awacs2:SetModex(611)
awacs2:SetTakeoffCold()
awacs2:__Start(1)

-- Rescue Helo with home base Lake Erie. Has to be a global object! Group name for helo
rescuehelo2=RESCUEHELO:New("CVN-72 Lincoln", "Rescue Helo Lincoln")
rescuehelo2:SetHomeBase(AIRBASE:FindByName("PerryAirfield1"))
rescuehelo2:SetModex(41)
rescuehelo2:SetTakeoffAir()
rescuehelo2:__Start(1)



-- Create AIRBOSS object. Use Unit name
local AirbossGWashington=AIRBOSS:New("CVN-72 Lincoln")
AirbossGWashington:SetDebugModeOFF()

AirbossGWashington:SetICLS(2,"LNCLN")
AirbossGWashington:SetTACAN(72,"X","LNCLN")
-- Erlaubt das Einfliegen in das Landepattern ohne Marshall
AirbossGWashington:SetAirbossNiceGuy(true)
-- Stackhöhe setzen
AirbossGWashington:SetMaxMarshalStacks(4)
AirbossGWashington:SetMaxLandingPattern(6)
-- Setze Radiofrequenzen
AirbossGWashington:SetMarshalRadio(127.600,"AM")
AirbossGWashington:SetLSORadio(127.700,"AM")


-- Radio relay units.
AirbossGWashington:SetRadioRelayLSO(tanker2:GetUnitName())
AirbossGWashington:SetRadioRelayMarshal("E-2D Magic Lincoln")

-- Set folder of airboss sound files within miz file.
AirbossGWashington:SetSoundfilesFolder("Airboss Soundfiles/")

-- Skipper menu.
AirbossGWashington:SetMenuRecovery(90, 20, true)

-- Carrier fährt nach letztem WP zum ersten.
AirbossGWashington:SetPatrolAdInfinitum(true)

-- Remove landed AI planes from flight deck.
AirbossGWashington:SetDespawnOnEngineShutdown()

-- Load all saved player grades from your "Saved Games\DCS" folder (if lfs was desanitized).
AirbossGWashington:Load()

-- Automatically save player results to your "Saved Games\DCS" folder each time a player get a final grade from the LSO.
AirbossGWashington:SetAutoSave()

-- Enable trap sheet.
AirbossGWashington:SetTrapSheet()

-- Set recovery tanker.
AirbossGWashington:SetRecoveryTanker(tanker2)

-- Set AWACS.
AirbossGWashington:SetAWACS(awacs2)


AirbossGWashington:SetHandleAIOFF()
AirbossGWashington:SetInitialMaxAlt(1500)
AirbossGWashington:SetRefuelAI(15)
AirbossGWashington:SetStaticWeather(true)

-- Start airboss class.
AirbossGWashington:Start()

env.info("AIRBOSS: Loaded configuration")